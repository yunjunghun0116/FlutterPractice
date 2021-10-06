import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';

class LoginBottomSheet extends StatelessWidget {
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
              'Sign In',
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
              controller: passwordController,
              obscureText: true,
            ),
          ],
        ),
      );
    }

    Widget _loginButton() {
      return Container(
        child: ElevatedButton(
          style: loginButtonStyle,
          onPressed: () async {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            FocusScope.of(context).unfocus();
            Get.back();
          },
          child: Text('로그인하기'),
        ),
      );
    }

    return
      Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: basicColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _topArea(),
            _emailArea(),
            _passwordArea(),
            _loginButton(),
          ],
        ),

    );
  }
}
