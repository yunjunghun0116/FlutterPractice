import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/main_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyLovelyPet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/main',
      getPages: [
        GetPage(
          name: '/',
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
