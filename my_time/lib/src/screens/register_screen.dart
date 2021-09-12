import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_time/src/screens/error_screen.dart';

class RegisterScreen extends StatelessWidget {
  //register->signin 만약 완료하면 get.toNamed('/')로 보내줘서 로그인할수있도록 한다.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _inputArea() {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: '이메일을 입력하세요',
              ),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: '패스워드를 입력하세요'),
              obscureText: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green.withOpacity(0.3),
      ),
      child: TextButton(
        onPressed: () async {
          UserCredential? user = await registerWithEmailPassword();
        },
        child: Text('회원가입'),
      ),
    );
  }

  Widget _registerArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _inputArea(),
          _registerButton(),
        ],
      ),
    );
  }

  Future<UserCredential?> registerWithEmailPassword() async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed('/');
      return user;
    } on FirebaseAuthException catch (e) {
      Get.off(() => ErrorScreen(message: e.message.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow,
      appBar: AppBar(),
      body: _registerArea(),
    );
  }
}
