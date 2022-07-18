import 'package:shared_preferences/shared_preferences.dart';

class LocalController {
  static SharedPreferences? _sharedPreferences;

  final String _loginIdKey = 'loginId';
  final String _userIdxKey = 'userIdx';
  final String _accessTokenKey = 'accessToken';
  final String _refreshTokenKey = 'refreshToken';

  Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) return;
    await _sharedPreferences!.clear();
  }

  Future<void> setLoginId(String loginId) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_loginIdKey, loginId);
  }

  Future<String?> getLoginId() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_loginIdKey);
  }

  Future<void> setUserIdx(String userIdx) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_userIdxKey, userIdx);
  }

  Future<String?> getUserIdx() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_userIdxKey);
  }

  Future<void> setAccessToken(String accessToken) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_accessTokenKey, accessToken);
  }

  Future<String?> getAccessToken() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_accessTokenKey);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_refreshTokenKey, refreshToken);
  }

  Future<String?> getRefreshToken() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_refreshTokenKey);
  }

}
