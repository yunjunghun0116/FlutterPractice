import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/models/home/benefit_model.dart';
import 'package:app/models/home/chair.dart';
import 'package:app/models/home/point_item.dart';
import 'package:app/screens/detail/components/carousel_image_area.dart';
import 'package:app/screens/detail/components/detail_benefits_area.dart';
import 'package:app/screens/detail/components/detail_info_area.dart';
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
      appBar: NavigationBarView(
          title: '상품정보'
      ),
      body: FutureBuilder(
        future: NetworkUtils().getItemDetailByIdAndToken(
          id: id
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
