import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:app/constants/constants_url.dart';
import 'package:app/controllers/local_controller.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/models/home/event_banner.dart';
import 'package:app/models/home/home_category_model.dart';
import 'package:app/models/home/invite_benefit/invite_benefit_model.dart';
import 'package:app/models/home/invite_history/invite_history_model.dart';
import 'package:app/models/home/invite_reward/invite_reward_model.dart';
import 'package:app/models/home/point_history/point_history.dart';
import 'package:app/models/home/product_rating_model.dart';
import 'package:app/models/home/user/user.dart';
import 'package:app/models/home/vip_class.dart';
import 'package:app/models/notification/notification_alarm.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

import '../models/event/event_detail_model.dart';
import '../models/event/event_list_model.dart';
import '../models/home/event_banner.dart';
import '../models/home/recommend_friend/recommend_model.dart';
import '../models/shopping/shopping_banner_model.dart';
import '../models/shopping/shopping_category_list_model.dart';
import '../models/shopping/shopping_detail_model.dart';
import '../models/shopping/shopping_list_model.dart';
import '../models/splash/splash_model.dart';
import '../models/splash/version_model.dart';
import 'api_manager.dart';
import 'common_utils.dart';

class NetworkUtils extends GetConnect {
  static Future<VersionRoot> getVersion() async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/code/app/code/${Utils.getOS() == 'android' ? 'ANDROID_VERSION' : 'IOS_VERSION'}',
        isBlock: false);
    return VersionRoot.fromJson(response.data);
  }

  static Future<SplashRoot> getSplash() async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/splash/fetch',
        isBlock: false);
    return SplashRoot.fromJson(response.data);
  }

  Future<List<EventBanner>> getBanner() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/main/banner');
    List eventBannerList = response.data['data'];
    List<EventBanner> bannerList = eventBannerList.map((e) {
      return EventBanner.fromJson(e);
    }).toList();
    return bannerList;
  }

  Future<List> getMainList() async {
    final response = await ApiManager.getResponse('$baseUrl/api/v1/main/list');
    List chairListData = response.data['data'];
    return chairListData;
  }

  // VIP ????????? ?????? ???????????????
  Future<List> getVIPBannerList() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/healingClass/top/banner');
    List vipBannerList = response.data['data']['imageBanner'];
    return vipBannerList;
  }

  // VIP ????????? ?????? VIP????????? ??????
  Future<List> getVIPClassList(parameters) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/healingClass/fetchPage',
        parameters: parameters);
    List classList = response.data['data']['content'];
    return classList;
  }

  //?????? ??? ??????
  Future<List<BannerData>> getShoppingBanner() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/banner');
    List data = response.data['data'];
    List<BannerData> bannerData =
        data.map((value) => BannerData.fromJson(value)).toList();
    return bannerData;
  }

  //?????? ??? ???????????? ?????????
  Future<List<CategoryData>> getShoppingCategoryList(parameters) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/goods/category',
        parameters: parameters);
    List data = response.data['data'];
    List<CategoryData> categoryData =
        data.map((value) => CategoryData.fromJson(value)).toList();
    return categoryData;
  }

  //?????? ??? ?????? ?????????
  Future<ShoppingListData> getShoppingList(parameters) async {
    final response = await ApiManager.getResponse('$baseUrl/api/v1/goods/list',
        parameters: parameters);
    LinkedHashMap<String, dynamic> data = response.data['data'];
    return ShoppingListData.fromJson(data);
  }

  //?????? ???????????? ??????
  Future<ShoppingDetailData> getShoppingDetailInfo(int goodsId) async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/$goodsId/detail');
    LinkedHashMap<String, dynamic> data = response.data['data'];
    return ShoppingDetailData.fromJson(data);
  }

  //????????????
  Future<void> getMyCart(int memberId) async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/shopping/cart/$memberId');
    // LinkedHashMap<String, dynamic> data = response.data['data'];
    // print('data : $response');
    // return ShoppingDetailData.fromJson(data);
  }

  Future<EventList> getEventList(parameters) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/event/fetchPage',
        parameters: parameters);
    return EventList.fromJson(response.data);
  }

  // ????????? ??????
  Future<EventDetail> getEventDetail(id, parameters) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/event/$id/detail',
        parameters: parameters);
    return EventDetail.fromJson(response.data);
  }

  Future<List> getMemberMainList(int userId) async {
    Response data = await get('$baseUrl/api/v1/main/list');
    if (data.isOk) {
      List listData = data.body['data'];
      return listData;
    }
    return [];
  }

  // VIP????????? ????????????
  Future<VIPClass> getVIPClassDetail(int id) async {
    Response data = await get('$baseUrl/api/v1/healingClass/$id/detail');
    if (data.isOk) {
      return VIPClass.fromJson(data.body['data']);
    } else {
      throw Exception("failed");
    }
  }

  Future<User?> postLoginUser({
    required String loginId,
    required String userIdx,
  }) async {
    //??????????????????
    List<int> hashString = utf8.encode('${userIdx}UNO');
    Digest hash = sha256.convert(hashString);

    Response loginResult = await post(
      '$baseUrl/api/v1/auth/united/login',
      {
        'loginId': loginId,
        'userIdx': userIdx,
        'hash': hash.toString(),
        'result': true
      },
    );
    if (loginResult.body['status'] == 'success') {
      // print("???????????? ????????? ??????" + loginResult.body['data']['accessToken']);
      // print("?????? ???????????? ??????" + loginResult.body['data']['refreshToken']);
      //accessToken, refreshToken ??????
      await LocalController()
          .setAccessToken(loginResult.body['data']['accessToken']);
      await LocalController()
          .setRefreshToken(loginResult.body['data']['refreshToken']);
      print('user : ${loginResult.body}');
      return User.fromJson(loginResult.body['data']);
    }
    return null;
  }

  //??????????????? ?????? API
  Future<int> getUserPoint(int userId) async {
    Response data = await get('$baseUrl/api/v1/point/history/$userId/amount');
    return data.body['data']['amount'];
  }

  //???????????? ?????? API
  Future<int> getCouponCount(int userId) async {
    Response data = await get('$baseUrl/api/v1/coupon/$userId/list');
    return data.body['data'];
  }

  //????????? ?????? ?????? API
  Future<int> getUsingCount(int userId) async {
    Response data = await get('$baseUrl/api/v1/myItem/amount?memberId=$userId');
    return data.body['data'];
  }

  Future<void> getItemDetailByIdAndToken({required int id}) async {
    Response data = await get('$baseUrl/api/v1/goods/$id/detail');
    return data.body['data'];
  }

  Future<List<HomeCategory>> getHomePageCategoryMenu() async {
    try {
      Response data = await get('$baseUrl/api/v1/main/category');
      List result = data.body['data'];
      return result.map((e) {
        return HomeCategory.fromJson(e);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<ProductRating?> getPoints(int goodsId) async {
    try {
      Response data = await get('$baseUrl/api/v1/goods/$goodsId/review/grade');
      return ProductRating.fromJson(data.body['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<PointHistory>> getPointHistory(
      User user, DateTime? date, bool isRecently) async {
    try {
      final data =
          await ApiManager.getResponse('$baseUrl/api/v1/point/history/fetch',
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
                    });
      List result = data.data['data']['content'];
      return result.map((e) {
        return PointHistory.fromJson(e);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

// ???????????? ?????????: ????????????, ????????????, ????????????
  Future<Recommend> getUserRecommendedHistory(
      int userId, String accessToken) async {
    final data =
        await ApiManager.getResponse('$baseUrl/api/v1/recommend/$userId');
    Recommend result = Recommend.fromJson(data?.data['data']);
    return result;
  }

// ???????????? ?????????: ???????????????
  Future<InviteReward> getInviteReward(int userId) async {
    final data =
        await ApiManager.getResponse('$baseUrl/api/v1/recommend/$userId/list');
    InviteReward result = InviteReward.fromJson(data?.data['data']);
    return result;
  }

  //???????????? ?????????: ?????? ??????
  Future<InviteHistory> getInviteSentHistory(
      int userId, String accessToken) async {
    final data = await ApiManager.getResponse(
        '$baseUrl/api/v1/recommend/history',
        parameters: {'size': 20, 'page': 0, 'memberId': userId});
    InviteHistory result = InviteHistory.fromJson(data?.data['data']);
    return result;
  }

  //???????????? ?????? ?????????
  Future<List<InviteBenefit>> getInviteBenefitList(
      int userId, String accessToken) async {
    final data = await ApiManager.getResponse(
        '$baseUrl/api/v1/recommend/$userId/benefit');
    List dataList = data?.data['data'];
    return dataList.map((e) {
      return InviteBenefit.fromJson(e);
    }).toList();
  }

  // ?????? ?????????
  Future<String> getUserGuide(int userId) async {
    final data = await get('$baseUrl/api/v1/event/72/detail');
    return data.body['data']['mainImage'];
  }

  Future<Map<String, dynamic>?> getUserDataWithDecryptedBFTK(
      String decryptedToken) async {
    try {
      Response response = await post(
        bftkUrl,
        {'accessToken': decryptedToken},
        contentType: 'application/json',
      );
      Map<String, dynamic> result = response.body['status'];
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserDataWithDecryptedBFRT(
      String decryptedToken) async {
    try {
      Response response = await post(
        bfrtUrl,
        {
          'refreshToken': decryptedToken,
          'clientId': 'membership',
        },
        contentType: 'application/json',
      );
      Map<String, dynamic> result = response.body;
      LocalController().setAccessToken(result['access_token']);
      LocalController().setRefreshToken(result['refresh_token']);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getMyItem(int memberId, String accessToken) async {
    try {
      Response response = await get(
        '$baseUrl/api/v1/myItem/getMyItem',
        query: {
          'memberId': '$memberId',
        },
        headers: {'Authorization': 'Bearer $accessToken'},
        contentType: 'application/json',
      );
      Map<String, dynamic> result = response.body;
      Map<String, dynamic> memberInfo =
          result['data']['content'][0]['memberInfo'];
      Map<String, dynamic>? jsonData = UserController.to.user?.toJson();
      if (jsonData != null) {
        jsonData['badgeYn'] = memberInfo['badgeYn'];
        jsonData['memberGradeType'] = memberInfo['memberGradeType'];
        UserController.to.updateUser(User.fromJson(jsonData));
        print('update Result : ${UserController.to.user!.toJson()}');
      }
      return;
    } catch (e) {
      print('getMyItem Error : $e');
      return;
    }
  }

  Future<int> getDisappearAmountPoint(String accessToken) async {
    try {
      Response response = await get(
          '$baseUrl/api/v1/point/history/disappear/amount',
          headers: {'Authorization': 'Bearer $accessToken'});
      return response.body['data']['amount'];
    } catch (e) {
      return 0;
    }
  }

  Future<List> getDisappearHistory(String accessToken) async {
    try {
      Response response =
          await get('$baseUrl/api/v1/point/history/disappear', query: {
        'size': '20',
        'sort': 'expirationDate',
        'page': '0',
      }, headers: {
        'Authorization': 'Bearer $accessToken'
      });
      print('result: ${response.body['data']['content']}');
      return response.body['data']['content'];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> postMassageTime(int index) async {
    try {
      if (UserController.to.user == null) return false;

      List<int> hashString =
          utf8.encode('HEALTH${UserController.to.user!.id}UNO');
      Digest hash = sha256.convert(hashString);

      Response response =
          await post('$baseUrl/api/v1/health/chair/register/v3', {
        'memberId': '${UserController.to.user!.id}',
        'usingTime': (index * 10).toString(),
        'hash': hash.toString(),
      }, headers: {
        'Authorization': 'Bearer ${UserController.to.user!.accessToken}'
      });
      print('result: ${response.body['status']}');
      return response.body['status'] == 'success';
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map<String, dynamic>?> getMassageCount() async {
    try {
      if (UserController.to.user == null) return null;
      Response response = await get('$baseUrl/api/v1/health/chair', headers: {
        'Authorization': 'Bearer ${UserController.to.user!.accessToken}'
      });
      print('massageCount result : ${response.body}');
      return {
        'count': response.body['data']['applyCount'],
        'date': response.body['data']['applyTime'],
      };
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<NotificationAlarm>?> getNotificationList(int userId) async {
    try {
      if (UserController.to.user == null) return null;
      Response response =
          await get('$baseUrl/api/v1/alarm/$userId/fetch', headers: {
        'Authorization': 'Bearer ${UserController.to.user!.accessToken}'
      }, query: {
        'page': '0',
        'size': '20',
      });
      log('notification result : ${response.body['data']['content']}');
      List result = response.body['data']['content'];
      return result.map((alarm) {
        return NotificationAlarm.fromJson(alarm);
      }).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
