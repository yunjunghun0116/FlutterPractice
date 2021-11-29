import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakaologinandgooglemaps/models/place_detail.dart';
import 'package:uuid/uuid.dart';
import '../utils/google_map_services.dart';
import '../models/place.dart';

class PlaceAutoCompleteScreen extends StatefulWidget {
  const PlaceAutoCompleteScreen({Key? key}) : super(key: key);

  @override
  State<PlaceAutoCompleteScreen> createState() =>
      _PlaceAutoCompleteScreenState();
}

class _PlaceAutoCompleteScreenState extends State<PlaceAutoCompleteScreen> {
  final TextEditingController _searchController = TextEditingController();
  var uuid = const Uuid();
  var sessionToken;
  var googleMapServices;
  PlaceDetail? placeDetail;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      const Marker(
        markerId: MarkerId('initialPosition'),
        position: LatLng(36.59288, 127.29237),
        infoWindow: InfoWindow(
          title: 'MyPosition',
          snippet: 'Where am I?',
        ),
      ),
    );
  }

  Future<void> _moveCamera() async {
    if (_markers.isNotEmpty) {
      setState(() {
        _markers.clear();
      });
    }
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(placeDetail!.lat, placeDetail!.lng),
      ),
    );

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(placeDetail!.placeId),
        position: LatLng(placeDetail!.lat,placeDetail!.lng),
        infoWindow: InfoWindow(
          title: placeDetail!.name,
          snippet: placeDetail!.formattedAddress,
        )
      ),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Places Autocomplete')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text('Place Autocomplete'),
              ),
              TypeAheadField(
                debounceDuration: const Duration(milliseconds: 500),
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search Places...',
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  //pattern에맞게 구글맵서비스를 call한다
                  sessionToken ??= uuid.v4();
                  googleMapServices =
                      GoogleMapServices(sessionToken: sessionToken);
                  return await googleMapServices.getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  //매칭되는것들을 어떻게표현할것인지.
                  Place place = suggestion as Place;
                  return ListTile(
                    title: Text(
                      place.decription,
                    ),
                    subtitle: Text(place.placeId),
                  );
                },
                onSuggestionSelected: (suggestion) async {
                  //선택되었을때
                  Place place = suggestion as Place;
                  print('place: ${place.toMap()}');
                  placeDetail = await googleMapServices.getPlaceDetail(
                    place.placeId,
                    sessionToken,
                  );
                  sessionToken = null;
                  _moveCamera();
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 350,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(36.59288, 127.29237),
                    zoom: 14,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  myLocationEnabled: true,
                  markers: _markers,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
