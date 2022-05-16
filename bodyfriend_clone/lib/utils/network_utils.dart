import 'package:bodyfriend_clone/models/event_banner.dart';
import 'package:get/get.dart';

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

  Future<List> getVIPClassList() async{
    Response data = await get('$_baseUrl/api/v1/healingClass/fetchPage',headers: {
      'page':'0',
      'size':'20'
    });
    List classList = data.body['data']['content'];
    return classList;
  }

  Future<void> getVIPClassDetail(int id)async{
    Response data = await get('$_baseUrl/api/v1/healingClass/$id/detail');
    print(data.body['data']);
  }

}
