import 'package:flutter/material.dart';

import '../constants.dart';

class MassageChairCard extends StatelessWidget {
  final double widgetWidth;
  final String imageUrl;
  final String title;
  final String price;
  final String rentalPrice;
  const MassageChairCard({
    Key? key,
    required this.widgetWidth,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rentalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.star_border,
                color: kWhiteColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(title),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: kGreyColor, fontSize: 12),
              children: [
                TextSpan(
                    text: price,
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
                  text: rentalPrice,
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
    );
  }
}
