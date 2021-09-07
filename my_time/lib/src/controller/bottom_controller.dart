import 'package:get/get.dart';

class BottomBarController extends GetxController{

  static BottomBarController get to => Get.find();
  RxInt currentIndex = 0.obs;
  
}