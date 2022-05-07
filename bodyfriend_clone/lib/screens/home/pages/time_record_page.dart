import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/screens/home/pages/components/time_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeRecordPage extends StatefulWidget {
  const TimeRecordPage({Key? key}) : super(key: key);
  @override
  State<TimeRecordPage> createState() => _TimeRecordPageState();
}

class _TimeRecordPageState extends State<TimeRecordPage> {
  int selectedIndex = 0;

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
          '안마의자',
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
            const Spacer(flex: 1,),
            Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 30,bottom: 20),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: kBlackColor.withOpacity(0.9),
                  ),
                  child: const Text('사용시간을 선택해\n기록해 보세요!',style: TextStyle(
                    color: kWhiteColor,
                  ),),
                ),
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
                        image: AssetImage(
                            'assets/memberships/img_chair_bg@3x.png'),
                      )),
                      child: selectedIndex > 0
                          ? Image.asset(
                              'assets/memberships/img_chair_${selectedIndex}@3x.png')
                          : Container(),
                    ),
                    Positioned(
                      left: 5,
                      top: 5,
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset(
                          'assets/memberships/ic_chair_count_0.png',
                        ),
                      ),
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
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                }),
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
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: selectedIndex != 0
                          ? LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [kMainColor.withOpacity(0.3), kMainColor],
                            )
                          : null,
                      color: selectedIndex == 0
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