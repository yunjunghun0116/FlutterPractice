import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakaologinandgooglemaps/controllers/database_controller.dart';
import 'package:kakaologinandgooglemaps/controllers/location_controller.dart';
import 'package:kakaologinandgooglemaps/screens/google_map_screen.dart';
import 'package:kakaologinandgooglemaps/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:kakaologinandgooglemaps/screens/kakao_login_screen.dart';

void main() {
  KakaoContext.clientId = 'eb012a94bf47a3cf04c493f381e9ec60';
  runApp(const MyApp());
}


//googleapi key : AIzaSyBvD79Y7m_UW7pzWAnsZsA7-EgKmEKviEA
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder((){
        Get.put(DatabaseController());
        Get.put(LocationController());
      }),
      debugShowCheckedModeBanner: false,
      title: 'KakaoLoginAndGoogleMaps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/kakao',
          page: () => const KakaoLoginScreen(),
        ),
        GetPage(
          name: '/google',
          page: () => GoogleMapScreen(),
        ),
      ],
    );
  }
}
