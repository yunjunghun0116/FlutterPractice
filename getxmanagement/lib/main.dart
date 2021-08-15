import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/first_screen.dart';
import 'package:getxmanagement/screens/home_screen.dart';
import 'package:getxmanagement/screens/next_screen.dart';
import 'package:getxmanagement/screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: '/',
            page: () => HomeScreen(),
            transition: Transition.leftToRight,),
        GetPage(
            name: '/first',
            page: () => FirstScreen(),
            transition: Transition.leftToRight,),
        GetPage(
            name: '/second',
            page: () => SecondScreen(),
            transition: Transition.leftToRight,),
        GetPage(
            name: '/next',
            page: () => NextScreen(),
            transition: Transition.leftToRight,),
        GetPage(
          name: '/user',
          page: () => NextScreen(),
          transition: Transition.leftToRight,),

      ],
    );
  }
}
