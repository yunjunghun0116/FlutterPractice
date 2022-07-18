import 'dart:collection';

import 'package:app/constants/constants_url.dart';
import 'package:app/models/shopping/shopping_detail_model.dart';
import 'package:app/models/shopping/shopping_list_model.dart';
import 'package:app/utils/api_manager.dart';
import 'package:get/get.dart';

import '../models/shopping/shopping_banner_model.dart';
import '../models/shopping/shopping_category_list_model.dart';

class ShoppingProvider extends GetConnect {
  Future<List<BannerData>> getShoppingBanner() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/banner');
    List data = response.data['data'];
    List<BannerData> bannerData =
        data.map((value) => BannerData.fromJson(value)).toList();
    return bannerData;
  }

  Future<List<CategoryData>> getShoppingCategoryList() async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/category');
    List data = response.data['data'];
    print(data);
    List<CategoryData> categoryData =
        data.map((value) => CategoryData.fromJson(value)).toList();
    return categoryData;
  }

  // Future<ShoppingListModel> getShoppingList(String categoryCode, String sort,
  //         String goodsType, int page, int size) =>
  //     get('https://membership.bodyfriend.me/api/v1/goods/list?categoryCode=$categoryCode&sort=$sort&goodsType=$goodsType&page=$page&size=$size')
  //         .then((response) {
  //       Map<String, dynamic> result = response.body;
  //
  //       print(result);
  //
  //       if (result["status"] == "success") {
  //         return ShoppingListModel.fromJson(result);
  //       } else {
  //         throw Exception('faild');
  //       }
  //     });

  Future<ShoppingListData> getShoppingList(String categoryCode, String sort,
      String goodsType, int page, int size) async {
    final response = await ApiManager.getResponse(
        '$baseUrl/api/v1/goods/list?categoryCode=$categoryCode&sort=$sort&goodsType=$goodsType&page=$page&size=$size');
    LinkedHashMap<String, dynamic> data = response.data['data'];
    return ShoppingListData.fromJson(data);
  }

  // Future<ShoppingDetailModel> getShoppingDetailInfo(int goodsId) =>
  //     get('https://membership.bodyfriend.me/api/v1/goods/$goodsId/detail')
  //         .then((response) {
  //       Map<String, dynamic> result = response.body;
  //
  //       print(result);
  //
  //       if (result["status"] == "success") {
  //         return ShoppingDetailModel.fromJson(result);
  //       } else {
  //         throw Exception('faild');
  //       }
  //     });

  Future<ShoppingDetailData> getShoppingDetailInfo(int goodsId) async {
    final response =
        await ApiManager.getResponse('$baseUrl/api/v1/goods/$goodsId/detail');
    LinkedHashMap<String, dynamic> data = response.data['data'];
    return ShoppingDetailData.fromJson(data);
  }
}

final shoppingProvider = ShoppingProvider();
