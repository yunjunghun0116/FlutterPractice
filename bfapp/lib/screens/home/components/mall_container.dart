import 'package:app/components/view/massage_chair_card_view.dart';
import 'package:app/components/view/point_item_card_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/models/home/chair.dart';
import 'package:app/models/home/point_item.dart';
import 'package:flutter/cupertino.dart';

class MallContainer extends StatelessWidget {
  final String title;
  final String description;
  final List goodsList;
  const MallContainer(
      {Key? key,
      required this.goodsList,
      required this.title,
      required this.description})
      : super(key: key);

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
                      ? MassageChairCardView(
                          chair: Chair.fromJson(goods),
                        )
                      : PointItemCardView(
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
