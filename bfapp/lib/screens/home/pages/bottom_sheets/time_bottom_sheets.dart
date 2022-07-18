import 'package:app/constants/constants.dart';
import 'package:app/constants/constants_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeBottomSheets extends StatefulWidget {
  const TimeBottomSheets({Key? key}) : super(key: key);
  @override
  State<TimeBottomSheets> createState() => _TimeBottomSheetsState();
}

class _TimeBottomSheetsState extends State<TimeBottomSheets> {
  int ampmState = 0;
  int hour = 0;
  int minute = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      color: kWhiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ampmState = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ampmState == 0 ? kMainColor : kLightGreyColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      '오전',
                      style: TextStyle(
                        color: ampmState == 0 ? kWhiteColor : kGreyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ampmState = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ampmState == 1 ? kMainColor : kLightGreyColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      '오후',
                      style: TextStyle(
                        color: ampmState == 1 ? kWhiteColor : kGreyColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      offAxisFraction: -0.3,
                      magnification: 1.1,
                      selectionOverlay: Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 30,
                        decoration: const BoxDecoration(
                            color: kLightGreyColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            )),
                      ),
                      itemExtent: 30,
                      onSelectedItemChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      children: kHoursTextList,
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      useMagnifier: true,
                      magnification: 1.1,
                      offAxisFraction: 0.3,
                      selectionOverlay: Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 30,
                        decoration: const BoxDecoration(
                            color: kLightGreyColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            )),
                      ),
                      itemExtent: 30,
                      onSelectedItemChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      children: kMinutesTextList,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
              color: kLightGreyColor,
            ))),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '취소',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(result: [hour, minute, ampmState]),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [kMainColor.withOpacity(0.3), kMainColor],
                      )),
                      child: const Text(
                        '확인',
                        style: TextStyle(
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
