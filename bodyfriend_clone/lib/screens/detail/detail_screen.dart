import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/benefit/benefit.dart';
import 'package:bodyfriend_clone/models/chair/chair.dart';
import 'package:bodyfriend_clone/models/point_item/point_item.dart';
import 'package:bodyfriend_clone/screens/detail/components/carousel_image_area.dart';
import 'package:bodyfriend_clone/screens/detail/components/detail_benefits_area.dart';
import 'package:bodyfriend_clone/screens/detail/components/detail_info_area.dart';
import 'package:bodyfriend_clone/utils/format_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/network_utils.dart';

class DetailScreen extends StatelessWidget {
  final ItemType type;
  final int id;
  const DetailScreen({Key? key, required this.id, required this.type})
      : super(key: key);

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
      body: FutureBuilder(
        future: NetworkUtils().getItemDetailByIdAndToken(
          id: id,
          accessToken: UserController.to.user != null
              ? UserController.to.user!.accessToken
              : null,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            late dynamic item;
            List<Benefit>? benefits;
            if (type == ItemType.chair) {
              item = Chair.fromJson(snapshot.data);
              benefits =
                  ((snapshot.data as Map<String, dynamic>)['benefits'] as List)
                      .map((e) {
                return Benefit.fromJson(e);
              }).toList();
            } else {
              item = PointItem.fromJson(snapshot.data);
            }

            return ListView(
              children: [
                CarouselImageArea(imageList: item.detailImage),
                DetailInfoArea(
                  id: item.id,
                  name: item.name,
                  price: item.price,
                  isChair: type == ItemType.chair,
                  rentPrice: type == ItemType.chair ? item.rentPrice : null,
                  reducePrice: type == ItemType.chair ? null : item.reducePrice,
                ),
                DetailBenefitsArea(benefits: benefits),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
