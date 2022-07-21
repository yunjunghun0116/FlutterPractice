import 'dart:async';

import 'package:app/constants/constants.dart';
import 'package:app/controllers/local_controller.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/icon.dart';
import 'package:app/models/home/auto_login_user/auto_login_user.dart';
import 'package:app/screens/main/main_screen.dart';
import 'package:app/utils/common_utils.dart';
import 'package:app/utils/local_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:app/utils/view_utils.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class SplashController extends GetxController {
  final _image =
      const Image(image: AssetImage(splash), fit: BoxFit.fitWidth).obs;
  set image(value) => _image.value = value;
  get image => _image.value;

  var moveToMain = false.obs;

  // 스플래시 이미지 호출
  Future<void> getSplash() async {
    var response = await NetworkUtils.getSplash();
    if (response.isBlank == false) {
      if (response.data?.imageBanner != null) {
        image = Image(
            image: NetworkImage(response.data?.imageBanner ?? ''),
            fit: BoxFit.fitWidth);
      }
    }
  }

  Future<void> getVersion() async {
    var response = await NetworkUtils.getVersion();
    if (response.isBlank == false) {
      checkUpdate(response.data?.value1);
    }
  }

  // 강제업데이트 필요한지 체크
  Future<bool> checkUpdate(data) async {
    var dataVer = data.toString().split('.');
    final info = await PackageInfo.fromPlatform();
    var infoVer = info.version.split('.');

    if (int.parse(dataVer[0]) > int.parse(infoVer[0]) ||
        int.parse(dataVer[1]) > int.parse(infoVer[1])) {
      ViewUtils.showAlertDialog(
          title: '업데이트',
          content: kUpdateNeedMsg,
          onTap: (isConfirm) {
            Utils.linkAppStore();
          });
    } else {
      Get.put(UserController());
      // 유효성검증
      // 1. 자동로그인 체크
      await checkAutoSignIn();
      moveMainScreen();
    }
    return false;
  }

  // 메인 페이지로 이동
  void moveMainScreen() {
    Timer(const Duration(milliseconds: 1000),
        () => Get.off(() => const MainScreen()));
  }

  void checkAutoLogin() async {
    String? accessToken = await LocalController().getAccessToken();
    String? refreshToken = await LocalController().getRefreshToken();
    if (accessToken == "" || refreshToken == "") {
      // removeToken();
    } else {
      requestToken();
    }
  }

  void requestToken() async {
    String secretKey = "a&9fql3@jDAE2f8#";
  }

  Future<void> checkAutoSignIn() async {
    Map<String, dynamic>? userData = await LocalController().getUserData();
    if (userData == null) {
      return;
    }
    AutoLoginUser autoLoginUser = AutoLoginUser.fromJson(userData);

    String decryptedBFTK = decryptToken(autoLoginUser.bftk);

    Map<String,dynamic>? result = await NetworkUtils().getUserDataWithDecryptedBFTK(decryptedBFTK);
    if(result==null) return;
    if(result['code']=='ERR_MS_5000'||result['code']=='ERR_MS_4001'){
      NetworkUtils().getUserDataWithDecryptedBFRT(decryptToken(autoLoginUser.bfrt));
      return;
    }
    UserController.to.loginUser(loginId: autoLoginUser.userId, userIdx: autoLoginUser.userIdx);
    String? accessToken = await LocalController().getAccessToken();
    if(accessToken==null) return;
    NetworkUtils().getMyItem(autoLoginUser.userId, accessToken);
  }
}
