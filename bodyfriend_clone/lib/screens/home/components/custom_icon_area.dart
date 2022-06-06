import 'package:bodyfriend_clone/screens/home/components/custom_icon_url_button.dart';
import 'package:bodyfriend_clone/screens/home/pages/sleep_record_page.dart';
import 'package:bodyfriend_clone/screens/home/pages/time_record_page.dart';
import 'package:bodyfriend_clone/screens/home/pages/vip_class_page.dart';
import 'package:bodyfriend_clone/screens/home/pages/water_record_page.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/category.dart';

class CustomIconArea extends StatelessWidget {
  const CustomIconArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: kWhiteColor,
      child: FutureBuilder(
          future: NetworkUtils().getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Category> data = snapshot.data as List<Category>;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data.map((category) {
                    print(category.displayNo);
                    return CustomIconUrlButton(
                      category: category,
                      onPressed: () {
                        switch (category.displayNo) {
                          case 1:
                            Get.to(() => const TimeRecordPage());
                            break;
                          case 2:
                            Get.to(() => const SleepRecordPage());
                            break;
                          case 3:
                            Get.to(() => const WaterRecordPage());
                            break;
                          case 4:
                            Get.to(() => const VIPClassPage());
                            break;
                          case 5:
                          case 6:
                          default:
                            return;
                        }
                      },
                    );
                  }).toList(),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
