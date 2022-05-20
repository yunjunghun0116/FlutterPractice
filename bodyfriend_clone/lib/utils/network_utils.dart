import 'package:bodyfriend_clone/models/event_banner.dart';
import 'package:bodyfriend_clone/models/user.dart';
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
    List listData = data.body['data'];
    return listData;
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

  Future<Map<String, dynamic>> getVIPClassDetail(int id) async {
    Response data = await get('$_baseUrl/api/v1/healingClass/$id/detail');
    return {
      'image': data.body['data']['imageForm'],
      'status': data.body['data']['status'],
      'applied': data.body['data']['applied'],
    };
  }

  Future<User> postLoginUser() async {
    Response loginResult = await post(
      '$_baseUrl/api/v1/auth/united/login',
      {
        'loginId': 'leedg5845',
        'password': 'body123!',
        'userIdx': '205915',
        'hash':
            '6a4b86bb3070318381be7c65a6f6d53412973ea07b14dc60efb94671a938eb3d',
        'result': true
      },
    );
    return User.fromJson(loginResult.body['data']);
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
