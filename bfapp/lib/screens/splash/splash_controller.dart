
import 'dart:async';
import 'dart:convert';

import 'package:app/constants/constants.dart';
import 'package:app/controllers/local_controller.dart';
import 'package:app/icon.dart';
import 'package:app/screens/main/main_screen.dart';
import 'package:app/utils/common_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:app/utils/view_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../../controllers/user_controller.dart';

class SplashController extends GetxController {

  final _image = const Image(
      image: AssetImage(splash),
      fit: BoxFit.fitWidth).obs;
  set image(value) => _image.value = value;
  get image => _image.value;

  var moveToMain = false.obs;

  // 스플래시 이미지 호출
  Future<void> getSplash() async {
    var response = await NetworkUtils.getSplash();
    if(response.isBlank == false) {
      image = Image(
          image: NetworkImage(response.data?.imageBanner ?? ''),
          fit: BoxFit.fitWidth);
    }
  }

  Future<void> getVersion() async {
    var response = await NetworkUtils.getVersion();
    if(response.isBlank == false) {
      checkUpdate(response.data?.value1);
    }
  }

  // 강제업데이트 필요한지 체크
  Future<bool> checkUpdate(data) async {
    var dataVer = data.toString().split('.');
    final info = await PackageInfo.fromPlatform();
    var infoVer = info.version.split('.');

    if(int.parse(dataVer[0]) > int.parse(infoVer[0]) ||
        int.parse(dataVer[1]) > int.parse(infoVer[1])) {
      ViewUtils.showAlertDialog(
          title: '업데이트',
          content: kUpdateNeedMsg,
          onTap: (isConfirm) {
            Utils.linkAppStore();
          }
      );
    } else {
      Get.put(UserController());
      String? loginId = await LocalController().getLoginId();
      String? userIdx = await LocalController().getUserIdx();
      String? accessToken = await LocalController().getAccessToken();
      String? refreshToken = await LocalController().getRefreshToken();

      //1. accessToken 복호화 -> AES256방식을 통해 복호화
      //2. User정보를 가져옴 -> accessToken
      const bfSecretKey = 'a&9fql3@jDAE2f8#';
      final key = sha256.convert(utf8.encode(bfSecretKey));
      final iv = sha256.convert(utf8.encode(bfSecretKey).sublist(16));

      // encrypt.Key keyObj = encrypt.Key.fromUtf8(key.toString());
      // encrypt.IV ivObj = encrypt.IV.fromUtf8(iv.toString());
      // final encrypter =encrypt.Encrypter(encrypt.AES(keyObj));
      // print(encrypter.decrypt(encrypt.Encrypted.from64(accessToken!),iv: ivObj));
      //
      // if (loginId != null && userIdx != null) {
      //   UserController.to.loginUser(loginId: loginId, userIdx: userIdx);
      // }

      moveMainScreen();
    }
    return false;
  }

  // 메인 페이지로 이동
  void moveMainScreen() {
    Timer(const Duration(milliseconds: 1000), () => Get.off(() => const MainScreen()));
  }
}