import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/local_controller.dart';
import 'package:huntalk/controllers/user_controller.dart';
import 'package:huntalk/screens/main/main_screen.dart';
import 'package:huntalk/screens/start/components/login_page.dart';
import 'package:huntalk/screens/start/components/register_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  Future<void> isSignIn()async{
    String? userId = await LocalController.to.getId();
    if(userId != null){
      UserController.to.getUser(userId);
      Get.offAll(()=>const MainScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    isSignIn();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: ()=>Get.to(()=> const LoginPage()),
              child: const Text('로그인하기'),
            ),
            TextButton(
              onPressed: ()=>Get.to(()=> const RegisterPage()),
              child: const Text('회원가입하기'),
            ),
          ],
        ),
      ),
    );
  }
}
