import 'package:bodyfriend_clone/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/chair_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
