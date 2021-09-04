import 'package:get/get.dart';

enum ScreenName { Home, Explore, Add, Subscribe, Library }

class RouteController extends GetxService {
  static RouteController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int newIndex) {
    currentIndex(newIndex);
  }
}
