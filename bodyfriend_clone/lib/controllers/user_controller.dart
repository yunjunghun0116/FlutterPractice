import 'dart:math';

import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:get/get.dart';
import '../models/user.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  User? user;

  void loginUser({required String loginId,required String userIdx}) async {
    user = await NetworkUtils().postLoginUser(
      loginId: loginId,
      userIdx: userIdx,
    );
    update();
  }

  Future<int> getUserPoint() async {
    return NetworkUtils().getUserPoint(user!.id, user!.accessToken);
  }

  Future<int> getCouponCount() async {
    return NetworkUtils().getCouponCount(user!.id, user!.accessToken);
  }

  Future<int> getUsingCount() async {
    return NetworkUtils().getUsingCount(user!.id, user!.accessToken);
  }

  Future<List> getMainList() async {
    return NetworkUtils().getMemberMainList(user!.id, user!.accessToken);
  }
}
