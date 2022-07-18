

import 'dart:async';

import 'package:app/icon.dart';
import 'package:app/models/splash/splash_model.dart';
import 'package:app/screens/main/main_screen.dart';
import 'package:app/screens/splash/splash_controller.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _splashController = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    getVersion();

    return Scaffold(
      body: FutureBuilder(
        future: _splashController.getSplash(),
        builder: (context, snapshot) {
          return Obx(() => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _splashController.image
          ));
        }
      )
    );
  }

  void getVersion() {
    _splashController.getVersion();
  }
}