

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {

  var titles = [];
  var selectedIndex = 0.obs;

  get index => selectedIndex.value;
  get title => titles[selectedIndex.value];

  void changedValue(int index) {
    selectedIndex.value = index;
  }
}