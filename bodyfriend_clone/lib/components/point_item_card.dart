import 'package:bodyfriend_clone/models/point_item/point_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../screens/detail/detail_screen.dart';
import '../utils/format_utils.dart';

class PointItemCard extends StatelessWidget {
  final PointItem pointItem;
  const PointItemCard({Key? key, required this.pointItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => DetailScreen(
          type: ItemType.pointItem,
          id: pointItem.id,
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
                  image: NetworkImage(pointItem.listImage),
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
            Text(
              '포인트몰 | ${pointItem.name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
                '${getPrice(pointItem.reducePrice != null && pointItem.reducePrice! > 0 ? pointItem.reducePrice! : pointItem.price)}P',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
