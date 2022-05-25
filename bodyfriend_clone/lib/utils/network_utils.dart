import 'dart:convert';

import 'package:bodyfriend_clone/controllers/local_controller.dart';
import 'package:bodyfriend_clone/models/event_banner.dart';
import 'package:bodyfriend_clone/models/user.dart';
import 'package:bodyfriend_clone/models/vip_class.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class NetworkUtils extends GetConnect {
  final String _baseUrl = 'http://dapi.bodyfriend.co.kr';

  Future<List<EventBanner>> getBanner() async {
    Response data = await get('$_baseUrl/api/v1/main/banner');
    List eventBannerList = data.body['data'];
    List<EventBanner> bannerList = eventBannerList.map((e) {
      return EventBanner.fromJson(e);
    }).toList();
    return bannerList;
  }

  Future<List> getMainList() async {
    Response data = await get('$_baseUrl/api/v1/main/list');
    List chairListData = data.body['data'];
    return chairListData;
  }

  Future<List> getMemberMainList(int userId, String accessToken) async {
    Response data = await get('$_baseUrl/api/v1/main/list',
        headers: {'Authorization': 'Bearer $accessToken'});
    if (data.isOk) {
      List listData = data.body['data'];
      return listData;
    }
    return [];
  }

  Future<List> getVIPBannerList() async {
    Response data = await get('$_baseUrl/api/v1/healingClass/top/banner');
    List dataList = data.body['data']['imageBanner'];
    return dataList;
  }

  Future<List> getVIPClassList() async {
    Response data = await get('$_baseUrl/api/v1/healingClass/fetchPage',
        headers: {'page': '0', 'size': '20'});
    List classList = data.body['data']['content'];
    return classList;
  }

  Future<VIPClass> getVIPClassDetail(int id) async {
    Response data = await get('$_baseUrl/api/v1/healingClass/$id/detail');
    return VIPClass.fromJson(data.body['data']);
  }

  Future<User?> postLoginUser({
    required String loginId,
    required String userIdx,
  }) async {
    //해쉬작업
    List<int> hashString = utf8.encode('${userIdx}UNO');
    Digest hash = sha256.convert(hashString); //나누어진 결과물(String X)

    Response loginResult = await post(
      '$_baseUrl/api/v1/auth/united/login',
      {'loginId': loginId, 'userIdx': userIdx, 'hash': hash.toString(), 'result': true},
    );

    await LocalController().setLoginId(loginId);
    await LocalController().setUserIdx(userIdx);

    if(loginResult.body['status']=='success'){
      return User.fromJson(loginResult.body['data']);
    }
    return null;

  }

  Future<int> getUserPoint(int userId, String accessToken) async {
    Response data = await get('$_baseUrl/api/v1/point/history/$userId/amount',
        headers: {'Authorization': 'Bearer $accessToken'});
    return data.body['data']['amount'];
  }

  Future<int> getCouponCount(int userId, String accessToken) async {
    Response data = await get('$_baseUrl/api/v1/coupon/$userId/list',
        headers: {'Authorization': 'Bearer $accessToken'});
    return data.body['data'];
  }

  Future<int> getUsingCount(int userId, String accessToken) async {
    Response data = await get(
      '$_baseUrl/api/v1/myItem/amount?memberId=$userId',
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    return data.body['data'];
  }
}
