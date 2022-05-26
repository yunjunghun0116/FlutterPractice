import 'dart:developer';

import 'package:bodyfriend_clone/controllers/local_controller.dart';
import 'package:bodyfriend_clone/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../controllers/user_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  //assets/memberships/img_splash_logo.pdf
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),()async{
      String? loginId = await LocalController().getLoginId();
      String? userIdx = await LocalController().getUserIdx();
      if(loginId!=null && userIdx != null){
        UserController.to.loginUser(loginId: loginId, userIdx: userIdx);
      }
      Get.offAll(()=>const MainScreen());
    });
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/memberships/splash_image.png',fit: BoxFit.cover,)
      ),
    );
  }
}
