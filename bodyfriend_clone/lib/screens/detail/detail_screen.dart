import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/models/chair.dart';
import 'package:bodyfriend_clone/screens/detail/components/carousel_image_area.dart';
import 'package:bodyfriend_clone/utils/format_utils.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Chair chair;
  const DetailScreen({Key? key, required this.chair}) : super(key: key);

  Widget getRating(double point) {
    List<Widget> _starList = [];
    for (int i = 0; i < 5; i++) {
      if (i < point.floor()) {
        _starList.add(const Icon(
          Icons.star,
          size: 15,
        ));
      } else {
        _starList.add(const Icon(
          Icons.star_border,
          size: 15,
        ));
      }
    }
    return Row(
      children: _starList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: const Text('상품정보'),
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          CarouselImageArea(imageList: chair.detailImage),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chair.name),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                      style: const TextStyle(color: kBlackColor),
                      children: [
                        TextSpan(
                            text: getPrice(chair.price),
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
                RichText(
                  text: TextSpan(
                      style: const TextStyle(color: kBlackColor),
                      children: [
                        TextSpan(
                            text: getPrice(chair.rentPrice),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        getRating(chair.popularScore / 20),
                        Text('${chair.popularScore / 20}'),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const Icon(
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
          ),
        ],
      ),
    );
  }
}
