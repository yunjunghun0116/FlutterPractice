import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalController {
  static SharedPreferences? _sharedPreferences;

  final String _accessTokenKey = 'accessToken';
  final String _refreshTokenKey = 'refreshToken';
  final String _userDataKey = 'userData';

  Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) return;
    await _sharedPreferences!.clear();
  }

  //alCCX0YS41+3U4X3OBwv/VA+6rHwqtbquq0I0bD2Xmk=
// AccessToken, RefreshToken 추가
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

  /*
  * userIdx: 205915,
  * userId: leedg5845,
  * userName: 이동근,
  * autoLogin: false,
  * bftk: THNj2jI0hdhFaKMSYedRD6oV11f1rvYt4qSp1OxLgzg=,
  * bfrt: Vn5PI3lcJHp6sgvF4NIu3De7ddxOLTMDeMQ0Ks7pSbs=
  * */
  Future<void> setUserData(Map<String,dynamic> userData) async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_userDataKey, jsonEncode(userData));
  }

  Future<Map<String,dynamic>?> getUserData() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    if(_sharedPreferences!.getString(_userDataKey)==null){
      return null;
    }
    return jsonDecode(_sharedPreferences!.getString(_userDataKey)!);
  }

}
