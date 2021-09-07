import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  //register->signin 만약 완료하면 get.toNamed('/')로 보내줘서 로그인할수있도록 한다.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _inputArea() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 50,
          ),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: '이메일을 입력하세요',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 50,
          ),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: '패스워드를 입력하세요'),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _inputArea(),
          ],
        ),
      ),
    );
  }
}
