import 'package:bodyfriend_clone/models/event_banner.dart';
import 'package:get/get.dart';

class NetworkUtils extends GetConnect {
  Future<List<EventBanner>> getBanner() async {
    Response data = await get(
      'http://dapi.bodyfriend.co.kr/api/v1/main/banner'
    );
    List eventBannerList = data.body['data'];
    List<EventBanner> bannerList = eventBannerList.map((e){
      return EventBanner.fromJson(e);
    }).toList();
    return bannerList;
  }
}
