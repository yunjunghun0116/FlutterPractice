import 'package:app/models/shopping/shopping_banner_model.dart';
import 'package:app/models/shopping/shopping_category_list_model.dart';
import 'package:app/models/shopping/shopping_list_model.dart';
import 'package:get/get.dart';

import '../models/shopping/shopping_detail_model.dart';

class ShoppingController extends GetxController{
  static ShoppingController get to => Get.find();
  List<Content>? list = <Content>[].obs;
  final totalElements = 0.obs;
  List<BannerData>? bannerData = <BannerData>[].obs;
  // List<CategoryData>? categoryData = <CategoryData>[].obs;
  final shoppingListIndicator = '10'.obs;
  List<CategoryData> categoryData = <CategoryData>[].obs;

  final imageIndicatorIndex = 0.obs;  //DetailViewImageIndecator
  Rx<ShoppingDetailData> detailData = ShoppingDetailData().obs;
  final extendDetailView = false.obs;
  final rentalData = false.obs;
  final soldOut = false.obs;

  get mList => list.obs;

  int get totalCount => totalElements.value;

  // Rx<List<BannerData>?> get bannerGetData => bannerData.obs;

  // Rx<List<CategoryData>?> get categoryGetData => categoryData.obs;
  
  int get getIndicatorIndex => imageIndicatorIndex.value;

  ShoppingDetailData get detailGetData => detailData.value;

  get getCategory => categoryData;

  bool get getExtendDetailView => extendDetailView.value;

  bool get getRentalValue => rentalData.value;

  bool get getSoldOutValue => soldOut.value;

  String get getShoppingIndicator => shoppingListIndicator.value;

  // void bannerList() async{
  //   Future.delayed(Duration.zero,()=>
  //       Get.dialog(const Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false)
  //   );
  //
  //   await ShoppingProvider().getShoppingBanner().then((value){
  //     bannerData = value;
  //     Get.back();
  //   }).catchError((onError){print(onError);});
  // }

  // void categoryList() async{
  //   Future.delayed(Duration.zero,()=>
  //       Get.dialog(const Center(child: CircularProgressIndicator()),
  //           barrierDismissible: false)
  //   );
  //
  //   await ShoppingProvider().getShoppingCategoryList().then((value){
  //     categoryData = value;
  //     Get.back();
  //   }).catchError((onError){print(onError);});
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('close');
  }

  void setIndicatorIndex(int currentIndex){
    imageIndicatorIndex.value = currentIndex;
  }

  void setTotalElement(int value){
    totalElements.value = value;
    print('totlalll $totalElements');
  }

  void saveShoppingDetailInfo(ShoppingDetailData? data){
    detailData.value = data!;
  }

  void resetShoppingDetailInfo(){
    detailData.value = ShoppingDetailData();
  }

  void setExtendDetailViewValue(bool value){
    extendDetailView.value = value;
  }

  void saveRentalInfo(bool? value){
    rentalData.value = value!;
    print('rentatl $value');
  }

  void saveSoldOutValue(bool? value){
    soldOut.value = value!;
  }

  void setListIndicator(String? value){
    shoppingListIndicator.value = value!;
  }

  void saveCategoryData(List<CategoryData> value){
    categoryData = value;
    print('eeeeee');
    print(categoryData[1].name);
  }

}