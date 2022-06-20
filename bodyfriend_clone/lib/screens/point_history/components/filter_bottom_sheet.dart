import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/utils/local_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateFilterList = getPointFilterList();
    return Container(
      height: 250,
      color: kWhiteColor,
      child: ListView(
        children: [
          const SizedBox(height: 20),
          kCustomListTile(
            text: '전체',
            onPressed: () {
              Get.back(result: {'isAll': true});
            },
          ),
          kCustomListTile(
            text: '${dateFilterList[0].year}년 ${dateFilterList[0].month}월~',
            onPressed: () {
              Get.back(result: {'isAll': false,'date':dateFilterList[0],'isRecently':true});
            },
          ),
          ...dateFilterList.sublist(1).map((DateTime date) {
            return kCustomListTile(
              text: '${date.year}년 ${date.month}월',
              onPressed: () {
                Get.back(result: {'isAll': false,'date':date,'isRecently':false});
              },
            );
          }).toList()
        ],
      ),
    );
  }
}

Widget kCustomListTile({required String text, required Function onPressed}) {
  return GestureDetector(
    onTap: () => onPressed(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(text),
        ),
        const Divider(),
      ],
    ),
  );
}
