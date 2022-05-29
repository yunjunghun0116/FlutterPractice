import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../utils/format_utils.dart';

class DetailInfoArea extends StatelessWidget {
  final String name;
  final int price;
  final int? rentPrice;
  final bool isChair;
  const DetailInfoArea({Key? key, required this.name, required this.price, this.rentPrice, required this.isChair}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
                style: const TextStyle(color: kBlackColor),
                children: [
                  TextSpan(
                      text: getPrice(price),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  const TextSpan(text: '원'),
                  const TextSpan(
                      text: ' / 구매가',
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                      ))
                ]),
          ),
          isChair
              ? RichText(
            text: TextSpan(
                style: const TextStyle(color: kBlackColor),
                children: [
                  TextSpan(
                      text: getPrice(rentPrice!),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  const TextSpan(text: '원'),
                  const TextSpan(
                      text: ' / 렌탈가(월)',
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                      ))
                ]),
          )
              : Container(),
          Row(
            children: const [
              Spacer(),
              Icon(
                Icons.favorite_border,
                color: kGreyColor,
                size: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
