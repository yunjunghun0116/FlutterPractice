import 'package:flutter/material.dart';
import 'package:widgetpractice/screens/google_map/components/google_map_control_button.dart';
import 'components/google_map_container.dart';

//apiKey : AIzaSyC-XJKXQ0gZoi5Mbxc3C-hdWSjXwIuzcU8
class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const GoogleMapContainer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GoogleMapControlButton(title: '버튼1', onClicked: () {}),
                  GoogleMapControlButton(title: '버튼2', onClicked: () {}),
                  GoogleMapControlButton(title: '버튼3', onClicked: () {}),
                  GoogleMapControlButton(title: '버튼4', onClicked: () {}),
                  GoogleMapControlButton(title: '버튼5', onClicked: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
