import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakaologinandgooglemaps/controllers/database_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final DatabaseController controller = DatabaseController.to;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){
      Map<String,dynamic>? userInfo = controller.getUserInfo();
      print(userInfo);
      Get.toNamed('/kakao');

    });
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
