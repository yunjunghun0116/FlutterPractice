import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'select_1.dart';
import 'select_2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  void currentIndexRaise() {
    if (currentIndex < 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Get.offAllNamed('/');
    }
  }

  Widget _getScreen() {
    switch (currentIndex) {
      case 0:
        return Select1(
          nextFunction: () {
            currentIndexRaise();
          },
        );
      case 1:
        return Select2(
          nextFunction: () {
            currentIndexRaise();
          },
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _getScreen(),
        ],
      ),
    );
  }
}
