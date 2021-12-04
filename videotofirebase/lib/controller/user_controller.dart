import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  static SharedPreferences? _sharedPreferences;
  static UserController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    _sharedPreferences = await SharedPreferences.getInstance();
    update();
  }

  void controllerClear(){
    _sharedPreferences!.clear();
  }

  void setUserInfo(String userData) async {
    await _sharedPreferences!.setString('userInfo', userData);
  }

  Map<String, dynamic>? getUserInfo() {
    String? _userData = _sharedPreferences!.getString('userInfo');
    if (_userData == null) {
      return null;
    } else {
      Map<String, dynamic> _userInfo = jsonDecode(_userData);
      return _userInfo;
    }
  }
}
