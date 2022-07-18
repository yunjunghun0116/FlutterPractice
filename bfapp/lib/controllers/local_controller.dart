import 'package:shared_preferences/shared_preferences.dart';

class LocalController {
  static SharedPreferences? _sharedPreferences;

  static  const String _loginIdKey = 'loginId';
  static  const String _userIdxKey = 'userIdx';

  static Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) return;
    await _sharedPreferences!.clear();
  }

  static Future<void> setLoginId(String loginId) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_loginIdKey, loginId);
  }

  static Future<String?> getLoginId() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_loginIdKey);
  }

  static Future<void> setUserIdx(String userIdx) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_userIdxKey, userIdx);
  }

  static Future<String?> getUserIdx() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_userIdxKey);
  }

}
