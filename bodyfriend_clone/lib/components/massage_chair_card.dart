import 'package:bodyfriend_clone/models/chair.dart';
import 'package:bodyfriend_clone/screens/detail/detail_screen.dart';
import 'package:bodyfriend_clone/utils/format_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class MassageChairCard extends StatelessWidget {
  final double widgetWidth;
  final Chair chair;
  const MassageChairCard({
    Key? key,
    required this.widgetWidth,
    required this.chair,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => DetailScreen(
          chair: chair,
        ),
      ),
      child: Container(
        width: widgetWidth,
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
                  image: AssetImage(chair.imageUrl),
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
            Text(chair.title),
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
            RichText(
              text: TextSpan(
                style: const TextStyle(color: kGreyColor, fontSize: 12),
                children: [
                  TextSpan(
                    text: getPrice(chair.rentalPrice),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(text: '원 / 렌탈가(월)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
