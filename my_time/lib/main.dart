import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/main_screen.dart';
import 'src/screens/register_screen.dart';
import 'src/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyTime',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.amber,
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
        GetPage(
          name: '/main',
          page: () => MainScreen(),
        ),
      ],
    );
  }
}
