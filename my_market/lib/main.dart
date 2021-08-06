import 'package:flutter/material.dart';
import 'package:my_market/screens/myapp.dart';

void main() {
  runApp(Market());
}

class Market extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}
