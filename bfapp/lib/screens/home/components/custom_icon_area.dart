import 'package:app/constants/constants_color.dart';
import 'package:app/models/home/home_category_model.dart';
import 'package:app/screens/home/components/custom_icon_url_button.dart';
import 'package:app/screens/home/pages/sleep_record/sleep_record_page.dart';
import 'package:app/screens/home/pages/time_record/time_record_page.dart';
import 'package:app/screens/home/pages/vip_class/vip_class_page.dart';
import 'package:app/screens/home/pages/water_record_page.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconArea extends StatelessWidget {
  const CustomIconArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: kWhiteColor,
      child: FutureBuilder(
          future: NetworkUtils().getHomePageCategoryMenu(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HomeCategory> data = snapshot.data as List<HomeCategory>;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data.map((homeCategory) {
                    return CustomIconUrlButton(
                      homeCategory: homeCategory,
                      onPressed: () {
                        switch (homeCategory.displayNo) {
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
