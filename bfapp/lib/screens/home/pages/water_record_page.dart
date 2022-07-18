import 'package:app/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaterRecordPage extends StatefulWidget {
  const WaterRecordPage({Key? key}) : super(key: key);

  @override
  State<WaterRecordPage> createState() => _WaterRecordPageState();
}

class _WaterRecordPageState extends State<WaterRecordPage> {
  int drinkWater = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
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
          "물마시기",
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
                          text: "W정수기",
                          style: TextStyle(
                            color: kBlueColor,
                          )),
                      TextSpan(text: "의\n깨끗한 물과\n함께하는\n"),
                      TextSpan(
                          text: "건강한 습관",
                          style: TextStyle(
                            color: kBlackColor,
                          )),
                    ],
                  ),
                ),
                const Spacer(),
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
                      "참여방법",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kGreyColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      height: 250,
                      child: Image.asset('images/img_water_purifier@3x.png'),
                    ),
                    const Positioned(
                      left: 0,
                      top: 20,
                      child: Text(
                        '0ml',
                        style: TextStyle(
                          fontSize: 30,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: -70,
                      top: 60,
                      height: 60,
                      child: SizedBox(
                        width: 60,
                        child: Image.asset('images/btn_water_on@3x.png'),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 10,
                      top: 220,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/img_cup@3x.png'),
                          ),
                        ),
                        child: Image.asset('images/img_cup_water@3x.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: kBlackColor,
                ),
                children: [
                  TextSpan(
                      text: "하루 5컵, 1L",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                    text: '를 마시면 ',
                  ),
                  TextSpan(
                      text: "포인트",
                      style: TextStyle(
                        color: kMainColor,
                      )),
                  TextSpan(
                    text: "를 드립니다",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }
}
