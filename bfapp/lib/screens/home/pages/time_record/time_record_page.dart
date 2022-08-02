import 'dart:async';

import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/icon.dart';
import 'package:app/screens/home/pages/components/time_button.dart';
import 'package:app/screens/home/pages/time_record/time_record_info_page.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/local_utils.dart';

class TimeRecordPage extends StatefulWidget {
  const TimeRecordPage({Key? key}) : super(key: key);
  @override
  State<TimeRecordPage> createState() => _TimeRecordPageState();
}

class _TimeRecordPageState extends State<TimeRecordPage> {
  int selectedIndex = 0;
  int applyCount = 0;

  Timer? _timer;

  int leaveTimes = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTimerAndTimes();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  void setTimerAndTimes() async {
    Map<String, dynamic>? result = await NetworkUtils().getMassageCount();
    if (result != null) {
      int slTimes = 7200 - getTimerTime(result['date']);
      setState(() {
        applyCount = result['count'];
        leaveTimes = slTimes > 0 ? slTimes : 0;
        //slTimes : applyDate로부터 얻어낸 now()와의 시간차 를 2시간에서 빼준것이다 -> 마지막 기록시간으로부터 2시간이 지났나 안지났나
      });
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (leaveTimes <= 0) {
          timer.cancel();
          return;
        }
        setState(() {
          leaveTimes--;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: NavigationBarView(title: '안마의자'),
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
                          text: '바디프랜드',
                          style: TextStyle(
                            color: kMainColor,
                          )),
                      TextSpan(text: '만이\n줄 수 있는\n섬세하고\n'),
                      TextSpan(
                          text: '편안한 휴식',
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
                      onTap: () => Get.to(() => const TimeRecordInfoPage()),
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
            const Spacer(
              flex: 1,
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: leaveTimes > 0 && selectedIndex != 0
                        ? Text(
                            getTimeWithTimerTime(leaveTimes),
                            style: const TextStyle(
                              color: kWhiteColor,
                            ),
                          )
                        : const Text(
                            '사용시간을 선택해\n기록해 보세요!',
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 180,
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('images/img_chair_bg@3x.png'),
                      )),
                      child: selectedIndex > 0
                          ? Image.asset(
                              'images/img_chair_$selectedIndex@3x.png')
                          : Container(),
                    ),
                    Positioned(
                      left: 5,
                      top: 5,
                      child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'images/ic_chair_count_$applyCount.png',
                          )),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 2.5,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 190,
                        decoration: BoxDecoration(
                            color: kGreyColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeButton(
                                currentIndex: 3,
                                selectedIndex: selectedIndex,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 3;
                                  });
                                }),
                            TimeButton(
                                currentIndex: 2,
                                selectedIndex: selectedIndex,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                }),
                            TimeButton(
                                currentIndex: 1,
                                selectedIndex: selectedIndex,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                }),
                            TimeButton(
                                currentIndex: 0,
                                selectedIndex: selectedIndex,
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (selectedIndex == 0 || leaveTimes > 0) return;
                      if (await NetworkUtils().postMassageTime(selectedIndex)) {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: 200,
                              color: kLightGreyColor,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: Image.asset(
                                          'images/android/point_coin.png'),
                                    ),
                                  ),
                                  const Text(
                                    '50P 적립되었습니다',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(20),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          kMainColor.withOpacity(0.4),
                                          kMainColor
                                        ],
                                      ),
                                    ),
                                    child: const Text(
                                      '확인',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        setTimerAndTimes();
                        setState(() => {});
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: selectedIndex != 0 && leaveTimes <= 0
                            ? LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  kMainColor.withOpacity(0.3),
                                  kMainColor
                                ],
                              )
                            : null,
                        color: selectedIndex == 0 || leaveTimes > 0
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
                  ),
                  const SizedBox(height: 30),
                  const Text('사용시간을 기록하면 포인트를 드립니다'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
