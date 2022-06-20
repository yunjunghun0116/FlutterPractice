import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/screens/main/main_screen.dart';
import 'package:bodyfriend_clone/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const SplashScreen(),
      initialBinding: BindingsBuilder((){
        Get.put(UserController());
      })

    ,
    );
  }
}
