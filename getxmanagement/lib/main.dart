import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/dependencies_manage_screen.dart';
import 'package:getxmanagement/screens/home_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/first_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/next_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/second_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/user_screen.dart';
import 'package:getxmanagement/screens/state_manage_screens/reactive_state_screen.dart';
import 'package:getxmanagement/screens/state_manage_screens/simple_state_screen.dart';

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
        ),
        GetPage(
          name: '/first',
          page: () => FirstScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/second',
          page: () => SecondScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/next',
          page: () => NextScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/user/:uid',
          page: () => UserScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/state/simple',
          page: () => SimpleStateScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/state/reactive',
          page: () => ReactiveStateScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/dependencies_manage_screens',
          page: () => DependenciesManagePage(),
          transition: Transition.leftToRight,
        ),
      ],
    );
  }
}
