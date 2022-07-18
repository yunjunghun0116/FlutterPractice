

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_sheet_controller.dart';

class ListBottomSheet extends StatelessWidget {

  final BottomSheetController bottomSheetController = Get.find();
  final Function(int index) onTap;

  ListBottomSheet({Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: getChild()
        )
    );
  }

  List<Widget> getChild() {
    List<Widget> child = [];
    var titles = bottomSheetController.titles;
    for(int i = 0; i < titles.length; i++) {
      var title = titles[i];
      child.add(ListTile(title: Text(title),
          onTap: () {
            Get.back(); // bottomSheet dismiss
            bottomSheetController.changedValue(i);  // 값 선택
            onTap(i); // 콜백 함수
          })
      );
    }
    return child;
  }
}