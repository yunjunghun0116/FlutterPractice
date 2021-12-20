import 'package:flutter/material.dart';
import 'package:widgetpractice/screens/GoogleMapPractice/google_map_container.dart';

//apiKey : AIzaSyC-XJKXQ0gZoi5Mbxc3C-hdWSjXwIuzcU8
class GoogleMapPractice extends StatelessWidget {
  const GoogleMapPractice({Key? key}) : super(key: key);

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
            const GoogleMapContainer(),
          ],
        ),
      ),
    );
  }
}
