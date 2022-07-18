import 'package:app/constants/constants_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/constants.dart';

class CountBottomSheets extends StatefulWidget {
  const CountBottomSheets({Key? key}) : super(key: key);

  @override
  State<CountBottomSheets> createState() => _CountBottomSheetsState();
}

class _CountBottomSheetsState extends State<CountBottomSheets> {
  int awakeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      color: kWhiteColor,
      child: Column(
        children: [
          Expanded(
            child: CupertinoPicker(
              magnification: 1.0,
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
                  awakeCount = value;
                });
              },
              children: const [
                Text('0'),
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
                Text('7'),
                Text('8'),
                Text('9'),
              ],
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
                    onTap: () => Get.back(result: [awakeCount]),
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
