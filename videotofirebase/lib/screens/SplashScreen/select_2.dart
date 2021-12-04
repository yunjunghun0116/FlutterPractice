import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:videotofirebase/controller/user_controller.dart';

class Select2 extends StatelessWidget {
  final Function nextFunction;
  Select2({Key? key, required this.nextFunction}) : super(key: key);

  final UserController controller = UserController.to;


  Future<void> _loginButtonPressed() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      Future<OAuthToken> token = AuthApi.instance.issueAccessToken(authCode);
      TokenManager manager = TokenManagerProvider.instance.manager;
      (manager.setToken(await token)).then((value) async {
        User user = await UserApi.instance.me();
        controller.setUserInfo(jsonEncode(user));
      }).then((value) {
        Get.offAllNamed('/');
      });
    } on KakaoAuthException catch (e) {
      print(e);
    } on KakaoClientException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  //카카오톡이 있을경우 카카오톡으로 로그인하는부분
  Future<void> _loginWithKakaoTalk() async {
    try {
      var data = await UserApi.instance.loginWithKakaoTalk();
    } catch (e) {
      print('error on login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text('select2'),
          ElevatedButton(
            onPressed: () {
              nextFunction();
            },
            child: const Text('다음으로'),
          ),
          ElevatedButton(
            onPressed: () {
              _loginButtonPressed();
            },
            child: const Text('카카오 로그인'),
          ),

        ],
      ),
    );
  }
}
