import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/screens/home/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopLoginButton extends StatelessWidget {
  const TopLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Map<String, dynamic>? userData = await Get.to(() => LoginPage());
        if (userData != null) {
          UserController.to.loginUser(
              userIdx: userData['userIdx'], loginId: userData['userId']);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        color: kBackgroundColor,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.person_outline,
                  color: kWhiteColor,
                ),
                backgroundColor: kMainColor,
              ),
              const SizedBox(width: 15),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: kBlackColor,
                  ),
                  children: [
                    TextSpan(
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.bold,
                        ),
                        text: '로그인'),
                    TextSpan(text: '해 주세요.'),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
