import 'package:flutter/material.dart';
import 'package:googlemappractice/screens/HomeScreen/home_screen.dart';
// AIzaSyBvD79Y7m_UW7pzWAnsZsA7-EgKmEKviEA
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoogleMapsFlutterCheck',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: const HomeScreen(),
    );
  }
}