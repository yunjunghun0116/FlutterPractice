
import 'dart:developer';

import 'package:app/components/view/option_view_controller.dart';
import 'package:app/components/view/selection_button.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/enum/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionView extends StatelessWidget {

  var title = '';
  List dataLists = [];
  FilterType filterType;
  double spacing;
  final Function(int index) changedValue;
  final OptionViewController controller;

  OptionView({
    Key? key,
    required this.title,
    required this.dataLists,
    this.filterType = FilterType.multi,
    this.spacing = 8.0,
    required this.changedValue,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    initValue();

    return Obx(() => Visibility(
        visible: controller.isVisible,
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: kGreyColor, fontSize: 14)),
                  Wrap(
                      spacing: spacing,
                      direction: Axis.horizontal,
                      children:
                      dataLists.map((e) {
                        return SelectionButton(title: e,
                            filterType: filterType,
                            isSelected: controller.selectedLists.contains(e),
                            onTap: (isSelected) {
                              checkMultiType();
                              controller.checkSelected(e);
                              changedValue(dataLists.indexOf(e));
                            });
                      }).toList()
                  )
                ]
            )
        ))
    );
  }

  // 초기 설정
  void initValue() {
    if (filterType == FilterType.must && controller.selectedLists.isEmpty) {
      selectFirstValue();
    }
  }

  // 단일선택 타입일 경우 선택된 것 초기화
  void checkMultiType() {
    if (filterType != FilterType.multi) { controller.selectedLists.clear(); }
  }

  void initSelected() {
    controller.selectedLists.clear();
    if (filterType == FilterType.must) {
      selectFirstValue();
    }
  }

  void selectFirstValue() {
    controller.selectedValue(dataLists.first);
    changedValue(0);
  }
}