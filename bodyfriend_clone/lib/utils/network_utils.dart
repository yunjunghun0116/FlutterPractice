import 'dart:convert';

import 'package:bodyfriend_clone/controllers/local_controller.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/category/category.dart';
import 'package:bodyfriend_clone/models/event_banner/event_banner.dart';
import 'package:bodyfriend_clone/models/point_history/point_history.dart';
import 'package:bodyfriend_clone/models/product_rating/product_rating.dart';
import 'package:bodyfriend_clone/models/user/user.dart';
import 'package:bodyfriend_clone/models/vip_class/vip_class.dart';
import 'package:bodyfriend_clone/utils/api_manager.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class NetworkUtils {
  final String _baseUrl = 'http://dapi.bodyfriend.co.kr';

  Future<List<EventBanner>> getBanner() async {
    Response? data =
        await APIManager().getResponse('$_baseUrl/api/v1/main/banner');
    if (data == null) return [];
    List eventBannerList = data.data['data'];
    List<EventBanner> bannerList = eventBannerList.map((e) {
      return EventBanner.fromJson(e);
    }).toList();
    return bannerList;
  }

  Future<List> getMainList() async {
    Response? data =
        await APIManager().getResponse('$_baseUrl/api/v1/main/list');
    if (data == null) return [];
    List chairListData = data.data['data'];
    return chairListData;
  }

  Future<List> getMemberMainList(int userId, String accessToken) async {
    Response? data = await APIManager().getResponse(
        '$_baseUrl/api/v1/main/list',
        headers: {'Authorization': 'Bearer $accessToken'});
    if (data == null) return [];
    List listData = data.data['data'];
    return listData;
  }

  Future<List> getVIPBannerList() async {
    Response? data = await APIManager()
        .getResponse('$_baseUrl/api/v1/healingClass/top/banner');
    if (data == null) return [];
    List dataList = data.data['data']['imageBanner'];
    return dataList;
  }

  Future<List> getVIPClassList() async {
    Response? data = await APIManager().getResponse(
        '$_baseUrl/api/v1/healingClass/fetchPage',
        parameters: {'page': '0', 'size': '20'});
    if (data == null) return [];
    List classList = data.data['data']['content'];
    return classList;
  }

  Future<VIPClass> getVIPClassDetail(int id) async {
    Response? data = await APIManager()
        .getResponse('$_baseUrl/api/v1/healingClass/$id/detail');
    return VIPClass.fromJson(data!.data['data']);
  }

  Future<User?> postLoginUser({
    required String loginId,
    required String userIdx,
  }) async {
    //해쉬작업
    List<int> hashString = utf8.encode('${userIdx}UNO');
    Digest hash = sha256.convert(hashString); //나누어진 결과물(String X)

    Response? loginResult = await APIManager().postResponse(
      '$_baseUrl/api/v1/auth/united/login',
      parameters: {
        'loginId': loginId,
        'userIdx': userIdx,
        'hash': hash.toString(),
        'result': true
      },
    );

    if (loginResult!.data['status'] == 'success') {
      await LocalController().setLoginId(loginId);
      await LocalController().setUserIdx(userIdx);
      print('loginUser : ${loginResult.data['data']}');
      return User.fromJson(loginResult.data['data']);
    }
    return null;
  }

  Future<int> getUserPoint(int userId, String accessToken) async {
    Response? data = await APIManager().getResponse(
        '$_baseUrl/api/v1/point/history/$userId/amount',
        headers: {'Authorization': 'Bearer $accessToken'});
    if (data == null) return 0;
    return data.data['data']['amount'];
  }

  Future<int> getCouponCount(int userId, String accessToken) async {
    Response? data = await APIManager().getResponse(
        '$_baseUrl/api/v1/coupon/$userId/list',
        headers: {'Authorization': 'Bearer $accessToken'});
    if (data == null) return 0;
    return data.data['data'];
  }

  Future<int> getUsingCount(int userId, String accessToken) async {
    Response? data = await APIManager().getResponse(
      '$_baseUrl/api/v1/myItem/amount?memberId=$userId',
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (data == null) return 0;
    return data.data['data'];
  }

  //TODO 이후 AccessToken을 통해 유저 데이터읽어올수 있도록 개발예정
  Future<void> getUserDataWithToken(String accessToken) async {}

  Future<Map<String, dynamic>> getItemDetailByIdAndToken(
      {required int id, String? accessToken}) async {
    Response? data = await APIManager().getResponse(
      '$_baseUrl/api/v1/goods/$id/detail',
      headers:
          accessToken != null ? {'Authorization': 'Bearer $accessToken'} : null,
    );
    return data!.data['data'];
  }

  Future<List<Category>> getCategory() async {
    try {
      Response? data =
          await APIManager().getResponse('$_baseUrl/api/v1/main/category');
      if (data == null) return [];
      List result = data.data['data'];
      return result.map((e) {
        return Category.fromJson(e);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<ProductRating?> getPoints(int goodsId) async {
    try {
      Response? data = await APIManager()
          .getResponse('$_baseUrl/api/v1/goods/$goodsId/review/grade');
      return ProductRating.fromJson(data!.data['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<PointHistory>> getPointHistory(
      User user, DateTime? date, bool isRecently) async {
    try {
      Response? data = await APIManager().getResponse(
        '$_baseUrl/api/v1/point/history/fetch',
        headers: {
          'Authorization': 'Bearer ${user.accessToken}',
        },
        parameters: date != null
            ? {
                'startDate': date.millisecondsSinceEpoch ~/ 1000,
                'endDate': isRecently
                    ? DateTime.now().millisecondsSinceEpoch ~/ 1000
                    : date.month == 12
                        ? DateTime(date.year + 1, date.month)
                                .millisecondsSinceEpoch ~/
                            1000
                        : DateTime(date.year, date.month + 1)
                                .millisecondsSinceEpoch ~/
                            1000,
                'page': 0,
                'size': 20,
              }
            : {
                'startDate': 946652400,
                'endDate': DateTime.now().millisecondsSinceEpoch ~/ 1000,
                'page': 0,
                'size': 20,
              },
      );
      List result = data!.data['data']['content'];
      print(result[0]);
      return result.map((e) {
        return PointHistory.fromJson(e);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
