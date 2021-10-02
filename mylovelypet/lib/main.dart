import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/main_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyLovelyPet',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => StartScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/main',
          page: () => MainScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/detail/:petMomentId',
          page: () => DetailScreen(),
          transition: Transition.downToUp,
        ),
      ],
    );
  }
}
