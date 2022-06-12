import 'package:bodyfriend_clone/models/chair/chair.dart';
import 'package:bodyfriend_clone/screens/detail/detail_screen.dart';
import 'package:bodyfriend_clone/utils/format_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class MassageChairCard extends StatelessWidget {
  final Chair chair;
  const MassageChairCard({
    Key? key,
    required this.chair,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => DetailScreen(
          type: ItemType.chair,
          id: chair.id,
        ),
      ),
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(chair.listImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/memberships/Group 1186a@3x.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(chair.name.replaceAll('(','\n(')),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: kGreyColor, fontSize: 12),
                children: [
                  TextSpan(
                      text: getPrice(chair.price),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                  const TextSpan(text: '원 / 구매가'),
                ],
              ),
            ),
            chair.rentPrice >0 ?RichText(
              text: TextSpan(
                style: const TextStyle(color: kGreyColor, fontSize: 12),
                children: [
                  TextSpan(
                    text: getPrice(chair.rentPrice),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(text: '원 / 렌탈가(월)'),
                ],
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
