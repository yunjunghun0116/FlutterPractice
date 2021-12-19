import 'package:flutter/material.dart';
import 'package:widgetpractice/screens/GoogleMapPractice/google_map_practice.dart';
import 'screens/CustomScrollViewPractice/custom_scroll_view_practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const CustomScrollViewPracitce(),
    );
  }
}