import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakaologinandgooglemaps/utils/google_map_services.dart';

class BigMap extends StatefulWidget {
  const BigMap({Key? key}) : super(key: key);

  @override
  State<BigMap> createState() => _BigMapState();
}

class _BigMapState extends State<BigMap> {
  Set<Marker> _markers = Set<Marker>();
  Position? position;
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? selectedLocation;
  bool loading = false;
  String? selectedAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setInitialPosition();
  }

  void _setInitialPosition() async {
    position = await Geolocator.getCurrentPosition();
    setState(() {});
  }

  void _selectLocation(LatLng location) async {
    setState(() {
      loading = true;
    });

    selectedAddress = await GoogleMapServices.getAddressFromLocation(
        location.latitude, location.longitude);
    setState(() {
      loading = false;
      selectedLocation = location;
    });

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(selectedLocation!.latitude, selectedLocation!.longitude),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose from map'),
        actions: [
          selectedLocation != null
              ? IconButton(
                  onPressed: () {
                    Get.back(result: {
                      'latitude':selectedLocation!.latitude,
                      'longitude':selectedLocation!.longitude,
                      'address':selectedAddress,
                    });
                  },
                  icon: const Icon(Icons.check),
                )
              : Container(),
        ],
      ),
      body: loading
          ? const Center(
              child: Text('map 로딩중~'),
            )
          : position != null
              ? GoogleMap(
                  onTap: (LatLng location) {
                    _selectLocation(location);
                  },
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(position!.latitude, position!.longitude),
                      zoom: 15),
                  onMapCreated: (GoogleMapController controller) {
                    if (!_controller.isCompleted) {
                      _controller.complete(controller);
                    }
                  },
                  markers: selectedLocation == null
                      ? {}
                      : {
                          Marker(
                            markerId: const MarkerId('selectedLocation'),
                            position: selectedLocation!,
                            infoWindow: InfoWindow(
                              title: '선택된 위치',
                              snippet: selectedAddress,
                            ),
                          )
                        },
                )
              : const Center(
                  child: Text('Map'),
                ),
    );
  }
}
