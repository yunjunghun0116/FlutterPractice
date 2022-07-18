import 'package:get/get.dart';

import '../models/shopping/shopping_category_list_model.dart';

class FilterController extends GetxController{
  static FilterController get to => Get.find();
  List<CategoryData>  shoppingKindSelectedItem = <CategoryData>[].obs;
  List<CategoryData> shoppingLineSelectedItem = <CategoryData>[].obs;
  List<String> firstSelectedItem = <String>[].obs;
  List<String> secondSelectedItem = <String>[].obs;

  List<CategoryData>  get getKindSelectedItem => shoppingKindSelectedItem;
  List<CategoryData> get getlineSelectedItem => shoppingLineSelectedItem;
  List<String> get getFirstSelectedItem => firstSelectedItem;
  List<String> get getSecondSelectedItem => secondSelectedItem;

  void saveSPKindSelectedItem(List<CategoryData>  item){
    shoppingKindSelectedItem = item;
    print('kind $shoppingKindSelectedItem');
  }

  void saveSPLineSelectedItem(List<CategoryData> item){
    shoppingLineSelectedItem = item;
  }

  void saveFirstSelectedItem(List<String> item){
    firstSelectedItem = item;
  }

  void saveSecondSelectedItem(List<String> item){
    secondSelectedItem = item;
  }

}