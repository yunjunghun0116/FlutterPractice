import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_time/src/screens/home_screen.dart';
import 'package:my_time/src/screens/login_screen.dart';
import 'package:my_time/src/screens/register_screen.dart';
import 'src/app.dart';

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
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => App(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterScreen(),
        ),
      ],
    );
  }
}
