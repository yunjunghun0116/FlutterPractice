import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/screens/first_screen.dart';
import 'package:getx_library/screens/fourth_screen.dart';
import 'package:getx_library/screens/getx_statement/statement_home_screen.dart';
import 'package:getx_library/screens/home_screen.dart';
import 'package:getx_library/screens/second_screen.dart';
import 'package:getx_library/screens/third_screen.dart';

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
      theme: ThemeData(
        primaryColor: Colors.blueGrey
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>const HomeScreen()),
        GetPage(name: '/first', page: ()=>const FirstScreen()),
        GetPage(name: '/second', page: ()=>const SecondScreen()),
        GetPage(name: '/third', page: ()=>const ThirdScreen()),
        GetPage(name: '/fourth/:id', page: ()=>const FourthScreen()),
        GetPage(name: '/statement', page: ()=>const StatementHomeScreen()),
      ],
    );
  }
}

