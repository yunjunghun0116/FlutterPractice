import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakaologinandgooglemaps/controllers/database_controller.dart';
import 'package:kakaologinandgooglemaps/controllers/location_controller.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);
  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final LocationController controller = LocationController.to;
  Completer<GoogleMapController> googleMapController = Completer();

  List<Marker> _markers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('1'),
        draggable: true,
        position: LatLng(controller.latitude, controller.longitude),
      ),
    );
  }
  
  void _updatePosition(CameraPosition position){
    var marker = _markers.firstWhere((element) => element.markerId == MarkerId('1'));
    _markers.remove(marker);
    _markers.add(
      Marker(
        markerId: MarkerId('1'),
        draggable: true,
        position: LatLng(position.target.latitude, position.target.longitude),
      ),
    );
    controller.changeLocation(position.target.latitude, position.target.longitude);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Google Map Screen'),
              InkWell(
                onTap: () async {
                  await controller.getLocation();
                  print(controller.latitude);
                  print(controller.longitude);
                },
                child: Container(
                  child: Text('내위치 가져오기'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  minMaxZoomPreference: MinMaxZoomPreference(1,30),
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  markers: Set.from(_markers),
                  onCameraMove: (_position)=>_updatePosition(_position),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(controller.latitude, controller.longitude),
                    zoom: 10,
                  ),
                  onMapCreated: (GoogleMapController gmc) {
                    googleMapController.complete(gmc);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
