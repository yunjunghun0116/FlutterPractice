import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'KakaomapScreen/kakaomap_screen.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({Key? key}) : super(key: key);

  @override
  _LocalScreenState createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  double myLat = 36.475;
  double myLng = 127.255375;


  Widget getScreen(double lat,double lng){
    return KakaokScreen(
      lat: lat,
      lng: lng,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            getScreen(myLat, myLng),
          ],
        ),
      ),
    );
  }
}
