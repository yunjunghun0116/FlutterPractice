import 'package:bodyfriend_clone/screens/home/components/custom_icon_button.dart';
import 'package:bodyfriend_clone/screens/home/pages/sleep_record_page.dart';
import 'package:bodyfriend_clone/screens/home/pages/time_record_page.dart';
import 'package:bodyfriend_clone/screens/home/pages/vip_class_page.dart';
import 'package:bodyfriend_clone/screens/home/pages/water_record_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          children: [
            CustomIconButton(
              title: '안마시간',
              icon: Icons.bed_outlined,
              onPressed: () {
                Get.to(() => const TimeRecordPage());
              },
            ),
            CustomIconButton(
              title: '수면시간',
              icon: Icons.airline_seat_flat_outlined,
              onPressed: () {
                Get.to(() => const SleepRecordPage());
              },
            ),
            CustomIconButton(
              title: '물마시기',
              icon: Icons.water_drop_outlined,
              onPressed: () {
                Get.to(()=>const WaterRecordPage());
              },
            ),
            CustomIconButton(
              title: 'VIP클래스',
              icon: Icons.edit_outlined,
              onPressed: () {
                Get.to(()=>const VIPClassPage());
              },
            ),
            CustomIconButton(
              title: '체성분분석',
              icon: Icons.accessibility_new_outlined,
              onPressed: () {},
            ),
            CustomIconButton(
              title: '유전체분석',
              icon: Icons.border_all_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
