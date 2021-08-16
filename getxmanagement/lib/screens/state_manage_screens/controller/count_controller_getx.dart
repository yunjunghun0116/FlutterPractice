import 'package:get/get.dart';

class CountControllerGetX extends GetxController{
  int count = 0;

  void increase(String id) {
    count++;
    update([id]);
  }

  void decrease(String id) {
    count--;
    update([id]);
  }

}