import 'package:app/constants/constants_color.dart';
import 'package:app/models/home/product_rating_model.dart';
import 'package:app/utils/format_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailInfoArea extends StatelessWidget {
  final int id;
  final String name;
  final int price;
  final int? rentPrice;
  final bool isChair;
  final int? reducePrice;
  const DetailInfoArea(
      {Key? key,
      required this.id,
      required this.name,
      required this.price,
      this.rentPrice,
      required this.isChair,
      this.reducePrice})
      : super(key: key);

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
            text:
                TextSpan(style: const TextStyle(color: kBlackColor), children: [
              TextSpan(
                  text: getPrice(isChair ? price : reducePrice!),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              isChair
                  ? const TextSpan(text: '원')
                  : const TextSpan(
                      text: 'P  ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
              isChair
                  ? const TextSpan(
                      text: ' / 구매가',
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                      ))
                  : TextSpan(
                      text: '${getPrice(price)}P',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: kGreyColor,
                      ),
                    ),
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
          const SizedBox(height: 10),
          Row(
            children: [
              FutureBuilder(
                  future: NetworkUtils().getPoints(id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ProductRating rating = snapshot.data as ProductRating;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingBar.builder(
                            initialRating: rating.startPoint,
                            minRating: 1,
                            direction: Axis.horizontal,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemSize: 12,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${rating.startPoint}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(width: 5),
                          RichText(
                              text: TextSpan(
                            style: const TextStyle(
                                color: kGreyColor, fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '${rating.reviewCount}',
                                  style: const TextStyle(
                                    color: kMainColor,
                                  )),
                              const TextSpan(text: '건'),
                            ],
                          ))
                        ],
                      );
                    }
                    return Container();
                  }),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: kGreyColor,
                size: 20,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
