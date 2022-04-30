import 'package:bodyfriend_clone/screens/home/components/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomIconArea extends StatelessWidget {
  const CustomIconArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: kWhiteColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CustomIconButton(title: '안마시간', icon: Icons.bed_outlined),
            CustomIconButton(title: '수면시간', icon: Icons.bed_outlined),
            CustomIconButton(title: '물마시기', icon: Icons.bed_outlined),
            CustomIconButton(title: 'VIP클래스', icon: Icons.bed_outlined),
            CustomIconButton(title: '체성분분석', icon: Icons.bed_outlined),
            CustomIconButton(title: '유전체분석', icon: Icons.bed_outlined),
          ],
        ),
      ),
    );
  }
}
