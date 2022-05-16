import 'package:bodyfriend_clone/models/vip_class.dart';
import 'package:bodyfriend_clone/screens/home/pages/bottom_sheets/filter_bottom_sheets.dart';
import 'package:bodyfriend_clone/screens/home/pages/components/vip_class_card.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class VIPClassPage extends StatefulWidget {
  const VIPClassPage({Key? key}) : super(key: key);

  @override
  State<VIPClassPage> createState() => _VIPClassPageState();
}

class _VIPClassPageState extends State<VIPClassPage> {
  List selectedLocationList = [];
  late int nowDateTime;

  @override
  void initState() {
    super.initState();
    nowDateTime = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
  }

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
      body: ListView(
        children: [
          FutureBuilder(
            future: NetworkUtils().getVIPBannerList(), //return값을 future로 받는 함수
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //위젯을 구성하는 부분
              if (snapshot.hasData) {
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
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: banner,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  }).toList(),
                );
              }
              return Container();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        List? result = await Get.bottomSheet(
                            const FilterBottomSheets(),
                            backgroundColor: kWhiteColor);
                        if (result != null) {
                          setState(() {
                            selectedLocationList = result;
                          });
                        }
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: kLightGreyColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.asset(
                          'assets/memberships/ic_filter@3x.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('필터'),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/memberships/ic_question_mark_line_18px@3x.png',
                        fit: BoxFit.cover,
                        color: kBlackColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text('VIP클래스란',style: TextStyle(
                        color: kGreyColor,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: NetworkUtils().getVIPClassList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List classList = snapshot.data;
                return Column(
                  children: classList.map((e) {
                    VIPClass vipclass = VIPClass.fromJson(e);
                    if (selectedLocationList.isEmpty ||
                        selectedLocationList.contains(vipclass.stateAddress)) {
                      return VIPClassCard(
                        vipclass: vipclass,
                        nowDateTime: nowDateTime,
                      );
                    }
                    return Container();
                  }).toList(),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
