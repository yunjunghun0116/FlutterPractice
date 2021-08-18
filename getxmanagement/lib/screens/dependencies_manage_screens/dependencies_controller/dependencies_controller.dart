import 'package:get/get.dart';

class DependenciesController extends GetxController {
  int count = 0;
  void increase() {
    count++;
    update();
  }
}
