import 'dart:convert';

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

  Future<List<Chair>> getChair() async {
    Response data = await get('$_baseUrl/api/v1/main/list');
    List chairListData = data.body['data'][0]['goodsList'];
    List<Chair> chairList = chairListData.map((e){
      return Chair.fromJson(e);
    }).toList();
    return chairList;
  }

  Future<void> getCategory() async{
    Response data = await get('$_baseUrl/api/v1/main/category');
    print('data : ${data.statusCode}');
    List chairList = data.body['data'];
  }

}
