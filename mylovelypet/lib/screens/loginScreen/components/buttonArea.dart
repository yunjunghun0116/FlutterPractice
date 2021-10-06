import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/constants.dart';
import 'login_bottom_sheet.dart';
import 'register_bottom_sheet.dart';

class ButtonArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton('로그인', () {
            Get.bottomSheet(LoginBottomSheet());
          }),
          SizedBox(
            width: 30,
          ),
          CustomButton('회원가입', () {
            Get.bottomSheet(RegisterBottomSheet());
          }),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  CustomButton(this.text, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: ElevatedButton(
        style: loginButtonStyle,
        onPressed: () {
          onPressed();
        },
        child: Text(text),
      ),
    );
  }
}
