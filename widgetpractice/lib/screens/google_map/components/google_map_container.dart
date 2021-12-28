import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapContainer extends StatefulWidget {
  final double lat;
  final double lng;
  final double zoom;
  //lat,lng 바꿔주는함수
  final Function positionChange;
  //카메라이동함수
  final Function cameraMove;
  final Completer<GoogleMapController> controller;
  const GoogleMapContainer({
    Key? key,
    required this.lat,
    required this.lng,
    required this.zoom,
    required this.positionChange,
    required this.controller,
    required this.cameraMove,
  }) : super(key: key);

  @override
  _GoogleMapContainerState createState() => _GoogleMapContainerState();
}

class _GoogleMapContainerState extends State<GoogleMapContainer> {
  final Set<Marker> _markers = {};

  CameraPosition? _startPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startPosition = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: widget.zoom,
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('myLocation'),
        position: LatLng(widget.lat, widget.lng),
        infoWindow: const InfoWindow(
          title: '내 위치',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.8,
      child: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _startPosition!,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController _controller) {
          widget.controller.complete(_controller);
        },
        onTap: (LatLng position) {
          widget.positionChange(CameraPosition(target: position));
          widget.cameraMove(position.latitude,position.longitude);
        },
        onCameraMove: (CameraPosition position) {
          print('${position.target.latitude},${position.target.longitude}');
        },
      ),
    );
  }
}
