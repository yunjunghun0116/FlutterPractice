import 'dart:collection';
import 'dart:convert';

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

  // VIP 클래스 상단 배너리스트
  Future<List> getVIPBannerList() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/healingClass/top/banner');
    List vipBannerList = response.data['data']['imageBanner'];
    return vipBannerList;
  }

  // VIP 클래스 하단 VIP클래스 카드
  Future<List> getVIPClassList(parameters) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/healingClass/fetchPage',
        parameters: parameters);
    List classList = response.data['data']['content'];
    return classList;
  }

  //쇼핑 탭 배너
  Future<List<BannerData>> getShoppingBanner() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/banner');
    List data = response.data['data'];
    List<BannerData> bannerData =
        data.map((value) => BannerData.fromJson(value)).toList();
    return bannerData;
  }

  //쇼핑 탭 카테고리 리스트
  Future<List<CategoryData>> getShoppingCategoryList(parameters) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/goods/category',
        parameters: parameters);
    List data = response.data['data'];
    List<CategoryData> categoryData =
        data.map((value) => CategoryData.fromJson(value)).toList();
    return categoryData;
  }

  //쇼핑 탭 상품 리스트
  Future<ShoppingListData> getShoppingList(parameters) async {
    final response = await ApiManager.getResponse('$baseUrl/api/v1/goods/list',
        parameters: parameters);
    LinkedHashMap<String, dynamic> data = response.data['data'];
    return ShoppingListData.fromJson(data);
  }

  //쇼핑 상세보기 화면
  Future<ShoppingDetailData> getShoppingDetailInfo(int goodsId) async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/$goodsId/detail');
    LinkedHashMap<String, dynamic> data = response.data['data'];
    return ShoppingDetailData.fromJson(data);
  }

  //장바구니
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

  // 이벤트 상세
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

  // VIP클래스 상세화면
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
    //해쉬생성작업
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
      // print("저장하는 액세스 토큰" + loginResult.body['data']['accessToken']);
      // print("저장 리프레시 토근" + loginResult.body['data']['refreshToken']);
      //accessToken, refreshToken 추가
      await LocalController()
          .setAccessToken(loginResult.body['data']['accessToken']);
      await LocalController()
          .setRefreshToken(loginResult.body['data']['refreshToken']);
      print('user : ${loginResult.body}');
      return User.fromJson(loginResult.body['data']);
    }
    return null;
  }

  //보유포인트 호출 API
  Future<int> getUserPoint(int userId) async {
    Response data = await get('$baseUrl/api/v1/point/history/$userId/amount');
    return data.body['data']['amount'];
  }

  //보유쿠폰 호출 API
  Future<int> getCouponCount(int userId) async {
    Response data = await get('$baseUrl/api/v1/coupon/$userId/list');
    return data.body['data'];
  }

  //사용중 제품 호출 API
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

// 친구초대 페이지: 초대현황, 총포인트, 받은초대
  Future<Recommend> getUserRecommendedHistory(
      int userId, String accessToken) async {
    final data =
        await ApiManager.getResponse('$baseUrl/api/v1/recommend/$userId');
    Recommend result = Recommend.fromJson(data?.data['data']);
    return result;
  }

// 초대현황 페이지: 초대리워드
  Future<InviteReward> getInviteReward(int userId) async {
    final data =
        await ApiManager.getResponse('$baseUrl/api/v1/recommend/$userId/list');
    InviteReward result = InviteReward.fromJson(data?.data['data']);
    return result;
  }

  //초대현황 페이지: 보낸 초대
  Future<InviteHistory> getInviteSentHistory(
      int userId, String accessToken) async {
    final data = await ApiManager.getResponse(
        '$baseUrl/api/v1/recommend/history',
        parameters: {'size': 20, 'page': 0, 'memberId': userId});
    InviteHistory result = InviteHistory.fromJson(data?.data['data']);
    return result;
  }

  //친구초대 혜택 페이지
  Future<List<InviteBenefit>> getInviteBenefitList(
      int userId, String accessToken) async {
    final data = await ApiManager.getResponse(
        '$baseUrl/api/v1/recommend/$userId/benefit');
    List dataList = data?.data['data'];
    return dataList.map((e) {
      return InviteBenefit.fromJson(e);
    }).toList();
  }

  // 이용 가이드
  Future<String> getUserGuide(int userId) async {
    final data =
        await ApiManager.getResponse('$baseUrl/api/v1/event/72/detail');
    return data?.data['data']['mainImage'];
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
      Map<String,dynamic> result = response.body;
      LocalController().setAccessToken(result['access_token']);
      LocalController().setRefreshToken(result['refresh_token']);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getMyItem(String memberId,String accessToken)async{
    try {
      print(accessToken);
      Response response = await get(
        '$baseUrl/api/v1/myItem/getMyItem',
        query: {
          'memberId':memberId,
        },
        headers: {
          'Authorization' : 'Bearer $accessToken'
        },
        contentType: 'application/json',
      );
      Map<String,dynamic> result = response.body;
      Map<String,dynamic> memberInfo = result['data']['content'][0]['memberInfo'];
      Map<String,dynamic>? jsonData = UserController.to.user?.toJson();
      if(jsonData!=null){
        jsonData['badgeYn']=memberInfo['badgeYn'];
        jsonData['memberGradeType']= memberInfo['memberGradeType'];
        UserController.to.updateUser(User.fromJson(jsonData));
        print('update Result : ${UserController.to.user!.toJson()}');
      }
      return;
    } catch (e) {
      print(e);
      return;
    }
  }
}
