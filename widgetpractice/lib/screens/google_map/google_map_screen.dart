import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widgetpractice/controllers/google_map_data_controller.dart';
import 'package:widgetpractice/screens/google_map/components/google_map_control_button.dart';
import 'components/google_map_container.dart';

//apiKey : AIzaSyC-XJKXQ0gZoi5Mbxc3C-hdWSjXwIuzcU8
class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final GoogleMapDataController _controller = GoogleMapDataController.to;
  final Completer<GoogleMapController> _googleMapController = Completer();
  int currentIndex = 0;
  double currentLat = 36.475;
  double currentLng = 127.255375;
  String currentAddress = '';

  Widget _getInputArea() {
    switch (currentIndex) {
      case 0:
        return Column(
          children: [Text(currentAddress)],
        );
      default:
        return Container();
    }
  }

  void _cameraMove(double lat, double lng) async {
    final GoogleMapController _controller = await _googleMapController.future;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: const Text(
                '구글맵',
                style: TextStyle(fontSize: 24),
              ),
            ),
            GoogleMapContainer(
              lat: currentLat,
              lng: currentLng,
              zoom: 15,
              positionChange: (CameraPosition position) {
                setState(() {
                  currentLat = position.target.latitude;
                  currentLng = position.target.longitude;
                });
              },
              controller: _googleMapController,
              cameraMove: (double lat, double lng) {
                _cameraMove(lat, lng);
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //위치저장하기 위치검색하기 시작위치수정하기 내위치확인하기
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GoogleMapControlButton(
                      title: '내위치 확인하기',
                      onClicked: () async {
                        String _formattedAddress = await _controller
                            .getLocationWithLatLng(currentLat, currentLng);
                        setState(() {
                          currentAddress = _formattedAddress;
                        });
                      }),
                  GoogleMapControlButton(
                    title: '시작위치 수정하기',
                    onClicked: () {
                      setState(() {
                        currentLat = currentLat + 0.003;
                        currentLng = currentLng + 0.003;
                      });
                      _cameraMove(currentLat, currentLng);
                    },
                  ),
                  GoogleMapControlButton(
                    title: '위치 검색하기',
                    onClicked: () {
                      _controller.searchLocationWithQuery('세종');
                    },
                  ),
                  GoogleMapControlButton(
                    title: '위치 저장하기',
                    onClicked: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: _getInputArea(),
            ),
          ],
        ),
      ),
    );
  }
}
