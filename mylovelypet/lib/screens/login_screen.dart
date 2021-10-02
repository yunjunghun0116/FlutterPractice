import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/login_bottom_sheet.dart';
import '../components/register_bottom_sheet.dart';
import '../components/constants.dart';

class LoginScreen extends StatelessWidget {
  Widget _centerImage() {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 50),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/duri.png'),
        radius: 200,
      ),
    );
  }

  Widget _buttonArea() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            child: ElevatedButton(
              style: loginButtonStyle,
              onPressed: () {
                Get.bottomSheet(LoginBottomSheet());
              },
              child: Text('로그인'),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            width: 100,
            child: ElevatedButton(
              style: loginButtonStyle,
              onPressed: () {
                Get.bottomSheet(RegisterBottomSheet());
              },
              child: Text('회원가입'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            _centerImage(),
            _buttonArea(),
          ],
        ),
      ),
    );
  }
}
