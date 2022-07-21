import 'package:app/constants/constants_color.dart';
import 'package:app/icon.dart';
import 'package:app/models/home/vip_class.dart';
import 'package:app/screens/home/pages/vip_class/vip_class_detail_page.dart';
import 'package:app/utils/local_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VIPClassCardView extends StatelessWidget {
  final int nowDateTime;
  final VIPClass vipclass;
  const VIPClassCardView(
      {Key? key, required this.vipclass, required this.nowDateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => VIPClassDetailPage(vipClassId: vipclass.id)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  // "서울"표시
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        vipclass.detailImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: const BoxDecoration(
                      color: kBlackColor,
                    ),
                    child: Text(
                      vipclass.stateAddress,
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                nowDateTime - vipclass.eventDate > 0
                    ? Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width / 2,
                        decoration:
                            BoxDecoration(color: kBlackColor.withOpacity(0.6)),
                        child: const Text(
                          '종료',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: 10),
            Text(vipclass.title),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(icTime),
                ),
                const SizedBox(width: 5),
                Text(getDateTime(vipclass.eventDate)),
                const Text(' | '),
                Text(
                    '${vipclass.eventStartTime}~${vipclass.eventEndTime} (${vipclass.eventMinute})'),
                const SizedBox(width: 5),
                vipclass.price > 0
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: kRedColor,
                        ),
                        child: const Text(
                          '무료',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    icMap,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  vipclass.placeName,
                  style: const TextStyle(
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
