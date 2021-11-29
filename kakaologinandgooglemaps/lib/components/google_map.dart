import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakaologinandgooglemaps/constants.dart';
import 'package:http/http.dart' as http;

class GoogleMapsFlutter extends StatefulWidget {
  const GoogleMapsFlutter({Key? key}) : super(key: key);

  @override
  _GoogleMapsFlutterState createState() => _GoogleMapsFlutterState();
}

class _GoogleMapsFlutterState extends State<GoogleMapsFlutter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      const Marker(
        markerId: MarkerId('myInitialPosition'),
        position: LatLng(36.59288, 127.29237),
        infoWindow: InfoWindow(title: 'My Position', snippet: 'Where Am I?'),
      ),
    );
  }

  final Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<FormBuilderState> _formBuilderKey =
      GlobalKey<FormBuilderState>();
  final MapType _googleMapType = MapType.normal;
  final Set<Marker> _markers = Set();
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(36.59288, 127.29237),
    zoom: 14,
  );

  void _onMapCreated(GoogleMapController controller) {
    //이제 GoogleMapController를 쓸 준비가 되었다
    _controller.complete(controller);
  }

  Future<void> _searchPlaces(
      String locationName, double latitude, double longitude) async {
    setState(() {
      _markers.clear();
    });
    //1000km이내 장소찍기
    final String url =
        '$baseUrl?key=$apiKey&location=$latitude,$longitude&radius=1000&language=ko&keyword=$locationName';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == 'OK') {
        GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(latitude, longitude),
          ),
        );
        int i = 0;
        setState(() {
          final foundPlaces = data['results'];
          for(var place in foundPlaces){
            _markers.add(
              Marker(
                markerId: MarkerId('${i++}'),
                position: LatLng(place['geometry']['location']['lat'],place['geometry']['location']['lng']),
                infoWindow: InfoWindow(
                  title: place['name'],
                  snippet: place['vicinity'],
                )
              )
            );
          }
        });
      }else{
        print('Fail to fetch place data');
      }
    }
  }

  void _submit() {
    if (!_formBuilderKey.currentState!.validate()) {
      return;
    }
    _formBuilderKey.currentState!.save();
    final inputValues = _formBuilderKey.currentState!.value;
    final id = inputValues['placeId'];
    final foundPlace = places.firstWhere((place) => place['id'] == id);

    print(id);
    print(foundPlace['placeName']);

    _searchPlaces(foundPlace['placeName']!, 36.59288, 127.29237);
    Navigator.of(context).pop();
  }

  void _goToGangnam() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      right: 20,
                      left: 20,
                      bottom: 20,
                    ),
                    child: FormBuilder(
                      key: _formBuilderKey,
                      child: Column(
                        children: [
                          FormBuilderDropdown(
                            //name:value 형식으로 FormBuilder에 저장된다
                            name: 'placeId',
                            hint: Text('어떤 장소를 원하세요?'),
                            decoration: const InputDecoration(
                              filled: true,
                              labelText: '장소',
                              border: OutlineInputBorder(),
                            ),
                            items: places.map((place) {
                              return DropdownMenuItem(
                                value: place['id'],
                                child: Text(
                                  place['placeName']!,
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: _submit,
                    child: const Text('submit'),
                    color: Colors.indigo,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          GoogleMap(
            mapType: _googleMapType,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            markers: _markers,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FloatingActionButton.extended(
              onPressed: _goToGangnam,
              label: const Text(
                '강남에서볼까?',
              ),
              icon: const Icon(Icons.zoom_in),
              elevation: 8,
              backgroundColor: Colors.blue[400],
            ),
          ),
        ],
      ),
    );
  }
}
