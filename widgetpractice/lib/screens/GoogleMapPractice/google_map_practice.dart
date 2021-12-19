import 'package:flutter/material.dart';
import 'package:widgetpractice/screens/GoogleMapPractice/google_map_container.dart';

//apiKey : AIzaSyC-XJKXQ0gZoi5Mbxc3C-hdWSjXwIuzcU8
class GoogleMapPractice extends StatelessWidget {
  const GoogleMapPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('구글맵'),
          GoogleMapContainer(),
        ],
      ),
    );
  }
}
