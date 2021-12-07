import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kInitialPosition =  const CameraPosition(
    target: LatLng(36.474243247298, 127.25537504683),
    zoom: 15,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      const Marker(
        position: LatLng(36.474243247298, 127.25537504683),
        markerId: MarkerId('initialPosition'),
        infoWindow: InfoWindow(
          title: '내 위치',
          snippet: '마이크체크원투'
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.5,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kInitialPosition,
              markers: _markers,
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
              onTap: (LatLng position){
                print('latitude : ${position.latitude} and longitude : ${position.longitude}');
              },
            ),
          )
        ],
      ),
    );
  }
}
