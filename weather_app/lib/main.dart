import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import './screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/location':(context) =>LocationScreen(),
      },
    );
  }
}
