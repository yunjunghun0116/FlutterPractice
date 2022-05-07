import 'package:bodyfriend_clone/screens/home/pages/components/sleep_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

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
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          '수면시간',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
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
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.question_mark,
                        size: 15,
                        color: kGreyColor,
                      ),
                    ),
                    const Text(
                      '참여방법',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kGreyColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SleepButton(
              iconSrc: 'assets/memberships/ic_awakened@3x.png',
              title: '자리에 누운 시간',
              value: '00:00',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            SleepButton(
              iconSrc: 'assets/memberships/ic_awakened@3x.png',
              title: '잠에서 깨어난 시간',
              value: '00:00',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            SleepButton(
              iconSrc: 'assets/memberships/ic_awakened@3x.png',
              title: '중간에 깬 횟수',
              value: '00:00',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            SleepButton(
              iconSrc: 'assets/memberships/ic_awakened@3x.png',
              title: '총 수면 시간',
              value: '00:00',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
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
                              colors: [kMainColor.withOpacity(0.3), kMainColor],
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
