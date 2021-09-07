import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowLoginBottomSheet extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _titleArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _inputArea() {
    return Container(
      child: Column(
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
              decoration: InputDecoration(
                hintText: '이메일을 입력하세요',
              ),
              obscureText: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(right: 30),
          child: TextButton(
            onPressed: loginWithEmailPassword,
            child: Text('로그인하기'),
          ),
        ),
      ],
    );
  }

  void loginWithEmailPassword()async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Get.offAllNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            _titleArea(),
            SizedBox(
              height: 10.0,
            ),
            _inputArea(),
            _loginButton(),
          ],
        ),
      ),
    );
  }
}
