import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalController extends GetxController {
  static LocalController get to => Get.find();
  SharedPreferences? _sharedPreferences;

  final String _todoKey = 'todo';

  @override
  void onInit() async {
    super.onInit();
    await _setSharedPreferences();
  }

  Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    update();
  }

  Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.clear();
  }

}
