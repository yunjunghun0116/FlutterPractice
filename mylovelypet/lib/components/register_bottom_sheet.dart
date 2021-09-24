import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class RegisterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Widget _topArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 30,
        ),
        child: Row(
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
    }

    Widget _emailArea() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'email',
              style: loginTextStyle,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      );
    }

    Widget _passwordArea() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'password',
              style: loginTextStyle,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
            ),
          ],
        ),
      );
    }

    Widget _registerButton() {
      return Container(
        child: ElevatedButton(
          style: loginButtonStyle,
          onPressed: () async {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            FocusScope.of(context).unfocus();
            Get.back();
          },
          child: Text('회원가입하기'),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _topArea(),
            _emailArea(),
            _passwordArea(),
            _registerButton(),
          ],
        ),
      ),
    );
  }
}
