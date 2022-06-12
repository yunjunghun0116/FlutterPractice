import 'package:flutter/material.dart';

import '../../../components/massage_chair_card.dart';
import '../../../components/point_item_card.dart';
import '../../../constants.dart';
import '../../../models/chair/chair.dart';
import '../../../models/point_item/point_item.dart';

class MallContainer extends StatelessWidget {
  final String title;
  final String description;
  final List goodsList;
  const MallContainer({Key? key, required this.goodsList, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 10,
          color: kBackgroundColor,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    '더보기 +',
                    style: TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
              Text(
                description,
                style: const TextStyle(
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: goodsList.map((goods) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  title == '프랜드몰'
                      ? MassageChairCard(
                          chair: Chair.fromJson(goods),
                        )
                      : PointItemCard(
                          pointItem: PointItem.fromJson(goods),
                        ),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
