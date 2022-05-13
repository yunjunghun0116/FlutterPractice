import 'package:bodyfriend_clone/models/event_banner.dart';
import 'package:get/get.dart';

import '../models/chair.dart';

class NetworkUtils extends GetConnect {
  final String _baseUrl = 'http://dapi.bodyfriend.co.kr';

  Future<List<EventBanner>> getBanner() async {
    Response data = await get('$_baseUrl/api/v1/main/banner');
    List eventBannerList = data.body['data'];
    List<EventBanner> bannerList = eventBannerList.map((e){
      return EventBanner.fromJson(e);
    }).toList();
    return bannerList;
  }

  Future<List> getMainList() async {
    Response data = await get('$_baseUrl/api/v1/main/list');
    List chairListData = data.body['data'];
    return chairListData;
  }

  Future<List> getVIPBannerList() async{
    Response data = await get('$_baseUrl/api/v1/healingClass/top/banner');
    List dataList = data.body['data']['imageBanner'];
    return dataList;
  }

  Future<void> getVIPClassList() async{
    Response data = await get('$_baseUrl/api/v1/healingClass');
    print(data.body);
    List chairList = data.body['data'];
  }

}
