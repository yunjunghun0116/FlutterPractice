
import 'package:app/components/view/decoration_button.dart';
import 'package:app/components/view/option_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {

  List<Widget> optionLists = [];
  final Function() onTap;

  FilterBottomSheet({
    Key? key,
    required this.optionLists,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: optionLists,
                  ),
                )),
            SafeArea(
                child: Row(
                  children: [
                    Expanded(
                        child: DecorationButton(
                            title: '초기화',
                            onTap: () {
                              initSelected();
                            })
                    ),
                    Expanded(
                        child: DecorationButton(
                            title: '확인',
                            isGradient: true,
                            onTap: () {
                              Get.back();
                              onTap();
                            })
                    )
                  ],
                )
            )
          ],
        )
    );
  }

  // 선택 초기화
  void initSelected() {
    for (var element in optionLists) {
      if (element is OptionView) {
        element.initSelected();
      }
    }
  }
}