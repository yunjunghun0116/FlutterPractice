import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakaologinandgooglemaps/models/place_detail.dart';
import 'package:uuid/uuid.dart';
import '../utils/google_map_services.dart';
import '../models/place.dart';
import 'package:geolocator/geolocator.dart';

class PlaceWithLocationScreen extends StatefulWidget {
  const PlaceWithLocationScreen({Key? key}) : super(key: key);

  @override
  State<PlaceWithLocationScreen> createState() =>
      _PlaceWithLocationScreenState();
}

class _PlaceWithLocationScreenState extends State<PlaceWithLocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  var uuid = const Uuid();
  var sessionToken;
  var googleMapServices;
  PlaceDetail? placeDetail;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();
  //geolocator때문에 필요한것
  Position? position;
  double distance = 0.0;
  String myAddress = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //GPS사용가능한지?
    _checkGPSAvailability();
  }

  void _checkGPSAvailability() async {
    LocationPermission geolocationStatus = await Geolocator.checkPermission();
    print(geolocationStatus);
    if (geolocationStatus == LocationPermission.denied ||
        geolocationStatus == LocationPermission.deniedForever) {
      print('check');
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('GPS 사용불가'),
              content: const Text('GPS 사용불가로 인해 해당 기능을 사용할수 없습니다.'),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }).then((value) => Navigator.pop(context));
    } else {
      await _getGPSLocation();
    }
  }

  Future<void> _getGPSLocation() async {
    position = await Geolocator.getCurrentPosition();
    print(position!.latitude);
    print(position!.longitude);

    myAddress = await GoogleMapServices.getAddressFromLocation(
      position!.latitude,
      position!.longitude,
    );
    _setMyLocation(position!.latitude, position!.longitude);
  }

  void _setMyLocation(double lat, double lng) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('initialPosition'),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
            title: '내 위치',
            snippet: myAddress,
          ),
        ),
      );
    });
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

    await _getGPSLocation();
    myAddress = await GoogleMapServices.getAddressFromLocation(
        position!.latitude, position!.longitude);

    distance = Geolocator.distanceBetween(position!.latitude,
        position!.longitude, placeDetail!.lat, placeDetail!.lng);
    print('distance : $distance');
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(placeDetail!.placeId),
            position: LatLng(placeDetail!.lat, placeDetail!.lng),
            infoWindow: InfoWindow(
              title: placeDetail!.name,
              snippet: placeDetail!.formattedAddress,
            )),
      );
    });
  }

  Widget _placeInfo() {
    if (placeDetail == null) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('내 위치 : $myAddress'),
        Text('찾은 곳 위치 : ${placeDetail!.formattedAddress}'),
        Text('거리 : ${(distance / 1000).toStringAsFixed(2)} km'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Places With Location')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text('Places With Location'),
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
              SizedBox(
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
              _placeInfo(),
              ElevatedButton(onPressed: (){}, child: const Text('장소 선택하러 가기'),),
            ],
          ),
        ),
      ),
    );
  }
}
