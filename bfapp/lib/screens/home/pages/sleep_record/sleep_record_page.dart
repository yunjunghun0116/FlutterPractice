import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/screens/home/pages/bottom_sheets/count_bottom_sheets.dart';
import 'package:app/screens/home/pages/bottom_sheets/time_bottom_sheets.dart';
import 'package:app/screens/home/pages/components/sleep_button.dart';
import 'package:app/screens/home/pages/sleep_record/sleep_record_info_page.dart';
import 'package:app/utils/local_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SleepRecordPage extends StatefulWidget {
  const SleepRecordPage({Key? key}) : super(key: key);

  @override
  State<SleepRecordPage> createState() => _SleepRecordPageState();
}

class _SleepRecordPageState extends State<SleepRecordPage> {
  late DateTime nowTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowTime = DateTime.now();
  }

  int onSleepTimeHour = 22;
  int onSleepTimeMinute = 0;
  int onAwakeTimeHour = 7;
  int onAwakeTimeMinute = 0;
  int? wakeUpDuringSleep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: NavigationBarView(
          title: '수면시간'
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      color: kGreyColor,
                    ),
                    children: [
                      TextSpan(
                          text: '라클라우드',
                          style: TextStyle(
                            color: Colors.green,
                          )),
                      TextSpan(text: '에서\n경험하는\n'),
                      TextSpan(
                          text: '완전한 수면',
                          style: TextStyle(
                            color: kBlackColor,
                          )),
                    ],
                  ),
                ),
                const Spacer(),
                // 1. spacer
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.question_mark,
                        size: 10,
                        color: kGreyColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const SleepRecordInfoPage()),
                      child: const Text(
                        '참여방법',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kGreyColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            // Spacer(),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Image.asset(
                    'images/image 264@3x.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 30, bottom: 20),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: kBlackColor.withOpacity(0.9),
                      ),
                      child: const Text(
                        '사용시간을 선택해\n기록해 보세요!',
                        style: TextStyle(
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Spacer(),
            SleepButton(
              iconSrc: 'images/ic_sleep@3x.png',
              title: '자리에 누운 시간',
              value:
                  '${onSleepTimeHour < 10 ? '0$onSleepTimeHour' : onSleepTimeHour}:${onSleepTimeMinute < 10 ? '0$onSleepTimeMinute' : onSleepTimeMinute}',
              onPressed: () async {
                List? result = await Get.bottomSheet(const TimeBottomSheets());
                if (result != null) {
                  setState(() {
                    onSleepTimeHour =
                        result[2] == 0 ? result[0] : result[0] + 12;
                    onSleepTimeMinute = result[1];
                  });
                }
              },
            ),
            const SizedBox(height: 5),
            SleepButton(
              iconSrc: 'images/ic_awakened@3x.png',
              title: '잠에서 깨어난 시간',
              value:
                  '${onAwakeTimeHour < 10 ? '0$onAwakeTimeHour' : onAwakeTimeHour}:${onAwakeTimeMinute < 10 ? '0$onAwakeTimeMinute' : onAwakeTimeMinute}',
              onPressed: () async {
                List? result = await Get.bottomSheet(const TimeBottomSheets());
                if (result != null) {
                  setState(() {
                    onAwakeTimeHour =
                        result[2] == 0 ? result[0] : result[0] + 12;
                    onAwakeTimeMinute = result[1];
                  });
                }
              },
            ),
            const SizedBox(height: 5),
            SleepButton(
              iconSrc: 'images/ic_wake_up@3x.png',
              title: '중간에 깬 횟수',
              value: '${wakeUpDuringSleep ?? '선택'}',
              onPressed: () async {
                List? result = await Get.bottomSheet(const CountBottomSheets());
                if (result != null) {
                  setState(() {
                    wakeUpDuringSleep = result[0];
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            SleepButton(
              iconSrc: 'images/ic_sleep_total@3x.png',
              title: '총 수면 시간',
              value: timeDifference(onSleepTimeHour, onSleepTimeMinute,
                  onAwakeTimeHour, onAwakeTimeMinute),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: wakeUpDuringSleep != null
                          ? LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                kMainColor.withOpacity(0.3),
                                kMainColor
                              ],
                            )
                          : null,
                      color: wakeUpDuringSleep == null
                          ? Colors.grey.withOpacity(0.3)
                          : null,
                    ),
                    child: const Text(
                      '기록',
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: const Text('사용시간을 기록하면 포인트를 드립니다')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
