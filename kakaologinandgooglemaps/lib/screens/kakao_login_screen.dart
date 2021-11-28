import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakaologinandgooglemaps/controllers/database_controller.dart';

class KakaoLoginScreen extends StatefulWidget {
  const KakaoLoginScreen({Key? key}) : super(key: key);
  @override
  _KakaoLoginScreenState createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  final DatabaseController controller = DatabaseController.to;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _loginButtonPressed() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      Future<OAuthToken> token = AuthApi.instance.issueAccessToken(authCode);
      TokenManager manager = TokenManagerProvider.instance.manager;
      (manager.setToken(await token)).then((value) async {
        //manager에 토큰저장완료했기때문에 유저정보를 가져올수있음
        User user = await UserApi.instance.me();
        controller.setUserInfo(jsonEncode(user.kakaoAccount));
      }).then((value) {
        Get.toNamed('/google');
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
      print(data);
      // perform actions after login
    } catch (e) {
      print('error on login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: const Text('카카오계정 로그인'),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    User user = await UserApi.instance.me();
                    controller.setUserInfo(jsonEncode(user.kakaoAccount));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('로그인된 토큰 저장하기'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Map<String, dynamic>? user = controller.getUserInfo();
                    if (user != null) {
                      print(user['email']);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('로그인된 토큰 가져오기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
