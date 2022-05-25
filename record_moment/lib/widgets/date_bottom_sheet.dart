import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:record_moment/constants.dart';
import 'package:record_moment/utilities/local_date_utils.dart';

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet({Key? key}) : super(key: key);

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
  LocalDateUtils localDateUtils = LocalDateUtils();
  int year = 2022;
  int month = 1;
  int day = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context,[year,month,day]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('저장',style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.05,
                    offAxisFraction: -0.4,
                    itemExtent: 50,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        year = 2022 - value;
                      });
                    },
                    children: kYearList.map((e) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          '$e',
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.05,
                    itemExtent: 50,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        month = value + 1;
                      });
                    },
                    children: kMonthList.map((e) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          '$e 월',
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.05,
                    offAxisFraction: 0.4,
                    itemExtent: 50,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        month = value + 1;
                      });
                    },
                    children: kDayList
                        .sublist(0, localDateUtils.getDayLength(year, month))
                        .map((e) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          '$e 일',
                        ),
                      );
                    }).toList(),
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
