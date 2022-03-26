import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void buttonPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      if (await UserController.to.loginUser(
        email: _email,
        password: _password,
      )) {
        Future.delayed(
          const Duration(seconds: 1),
          () => Get.offAllNamed('/main'),
        );
      } else {
        Get.dialog(
          Dialog(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              child: const Text('로그인을 실패했습니다'),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('이메일'),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? s) {
                  _email = s!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일은 필수로 입력하셔야합니다.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('비밀번호'),
              TextFormField(
                onSaved: (String? s) {
                  _password = s!;
                },
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호는 필수로 입력하셔야합니다.';
                  }
                  return null;
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () => buttonPressed(context),
                  child: const Text('로그인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
