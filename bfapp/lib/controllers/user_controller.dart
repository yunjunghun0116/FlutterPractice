import 'dart:developer';

import 'package:app/controllers/local_controller.dart';
import 'package:app/models/home/user/user.dart';
import 'package:app/utils/network_utils.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  User? user;

  Future<void> loginUser(
      {required String loginId, required String userIdx}) async {
    User? result = await NetworkUtils().postLoginUser(
      loginId: loginId,
      userIdx: userIdx,
    );
    if (result != null) {
      LocalController().setRefreshToken(result.refreshToken);
      LocalController().setAccessToken(result.accessToken);
      log('userLoginSuccess : ${result.toJson()}');
      user = result;
      update();
      return;
    }
  }

  void updateUser(User newUser) async {
    user = newUser;
    update();
  }

  void signOut() {
    user = null;
    LocalController().clearSharedPreferences();
    update();
  }

  Future<int> getUserPoint() async {
    return NetworkUtils().getUserPoint(user!.id);
  }

  Future<int> getCouponCount() async {
    return NetworkUtils().getCouponCount(user!.id);
  }

  Future<int> getUsingCount() async {
    return NetworkUtils().getUsingCount(user!.id);
  }

  Future<List> getMainList() async {
    return NetworkUtils().getMemberMainList(user!.id);
  }
}
