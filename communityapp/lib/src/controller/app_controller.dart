import 'package:get/get.dart';

enum ScreenName { Home, Explore }

class AppController extends GetxService {
  //깍쇠를 통한 호출이 필요없도록 하는기능
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int newIndex) {
    //Rx타입의경우 =을 통해 value를 넣는것이아닌, ()를 통해 넣어준다.
    currentIndex(newIndex);
  }
}
