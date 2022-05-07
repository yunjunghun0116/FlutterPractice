import 'package:bodyfriend_clone/models/chair.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:get/get.dart';

class ChairController extends GetxController {
  static ChairController get to => Get.find(); //Controller에 접근

  List<Chair> _chairList = [];
  List<Chair> get chairList => _chairList;

  @override
  void onInit() {
    super.onInit();
    getChairList();
  }

  Future<void> getChairList() async {
    List<Chair> chairListData = await NetworkUtils().getChair();
    _chairList = chairListData;
    update();
  }

}
