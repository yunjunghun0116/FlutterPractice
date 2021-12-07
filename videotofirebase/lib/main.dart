import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:videotofirebase/screens/UploadScreen/upload_screen.dart';
import './screens/MainScreen/main_screen.dart';
import './screens/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

import 'controller/user_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoContext.clientId = '4311d55ec882339f8e101ed43a44bdc0';
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder((){
        Get.put(UserController());
      }),
      debugShowCheckedModeBanner: false,
      title: 'VideoToFirebase',
      theme: ThemeData(
          primaryColor: Colors.black
      ),
      initialRoute: '/upload',
      getPages: [
        GetPage(
          name: '/welcome',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/',
          page: () => const MainScreen(),
        ),
        GetPage(
          name: '/upload',
          page: () => const UploadScreen(),
        ),
      ],
    );
  }
}