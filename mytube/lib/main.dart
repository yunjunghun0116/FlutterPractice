import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytube/src/components/video_detail.dart';
import 'src/app.dart';
import 'src/binding/init_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyTube',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      //GetView를 사용하기위해선 Binding이 필요하다.
      initialBinding: InitBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => App(),
        ),
        GetPage(
          name: '/detail/:videoId',
          page: () => VideoDetail(),
        ),
      ],
    );
  }
}
