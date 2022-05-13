import 'dart:ui';

import 'package:bodyfriend_clone/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheets extends StatefulWidget {
  const FilterBottomSheets({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheets> createState() => _FilterBottomSheetsState();
}

class _FilterBottomSheetsState extends State<FilterBottomSheets> {
  List<String> stateList = ['전체', '진행중', '종료'];
  int stateIndex = 0;
  List<String> selectedLocationList = [];
  List<String> kLocationList = ['서울', '경기', '인천', '강원', '충청', '경상', '전라', '제주'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '진행중/종료',
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: stateList.map((e) {
                        return GestureDetector(
                          onTap: () {
                            switch (e) {
                              case '전체':
                                setState(() {
                                  stateIndex = 0;
                                });
                                break;
                              case '진행중':
                                setState(() {
                                  stateIndex = 1;
                                });
                                break;
                              case '종료':
                                setState(() {
                                  stateIndex = 2;
                                });
                                break;
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: stateList[stateIndex] == e
                                  ? kMainColor
                                  : kLightGreyColor,
                            ),
                            child: Text(
                              e,
                              style: TextStyle(
                                color: stateList[stateIndex] == e
                                    ? kWhiteColor
                                    : kBlackColor,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '지역 (중복선택)',
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 6,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10,
                      children: kLocationList.map((e) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedLocationList.contains(e)) {
                                selectedLocationList.remove(e);
                              } else {
                                selectedLocationList.add(e);
                              }
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 4),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedLocationList.contains(e)
                                        ? kMainColor
                                        : kLightGreyColor,
                                    width: selectedLocationList.contains(e)
                                        ? 1.5
                                        : 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(e,
                                    style: TextStyle(
                                      color: selectedLocationList.contains(e)
                                          ? kMainColor
                                          : kBlackColor,
                                      fontWeight: selectedLocationList.contains(e)
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                    )),
                              ),
                              selectedLocationList.contains(e)
                                  ? Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kMainColor,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          size: 12,
                                          color: kWhiteColor,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin:  EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: kLightGreyColor,
                )
              )
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        stateIndex = 0;
                        selectedLocationList.clear();
                      });
                    },
                    child: Container(
                      color: kWhiteColor,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text('초기화'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Get.back(result: selectedLocationList);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [kMainColor.withOpacity(0.65),kMainColor])
                      ),
                      child: const Text('확인',style: TextStyle(
                        color: kWhiteColor,
                      ),),
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
