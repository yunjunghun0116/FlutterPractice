import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class VIPClassPage extends StatelessWidget {
  const VIPClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'VIP클래스',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: FutureBuilder(
        future: NetworkUtils().getVIPBannerList(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List vipBannerList = snapshot.data;
            return CarouselSlider(
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: 3,
                ),
              ),
              items: vipBannerList.map((banner) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          banner
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
