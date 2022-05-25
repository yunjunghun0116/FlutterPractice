import 'package:shared_preferences/shared_preferences.dart';

class LocalController{

  static SharedPreferences? _sharedPreferences;

  final String _loginIdKey = 'loginId';
  final String _userIdxKey = 'userIdx';

  Future<void> _setSharedPreferences()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> clearSharedPreferences()async{
    if(_sharedPreferences == null) return;
    await _sharedPreferences!.clear();
  }

  Future<void> setLoginId(String loginId)async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_loginIdKey, loginId);
  }

  Future<String?> getLoginId()async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return  _sharedPreferences!.getString(_loginIdKey);
  }

  Future<void> setUserIdx(String userIdx)async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    await _sharedPreferences!.setString(_userIdxKey, userIdx);
  }

  Future<String?> getUserIdx()async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return  _sharedPreferences!.getString(_userIdxKey);
  }
}