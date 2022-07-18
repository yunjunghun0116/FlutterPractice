import 'package:app/constants/constants_color.dart';
import 'package:app/models/home/vip_class.dart';
import 'package:app/screens/home/components/vip_class_card_view.dart';
import 'package:app/screens/home/pages/bottom_sheets/filter_bottom_sheets.dart';
import 'package:app/screens/home/pages/vip_class_info_page.dart';
import 'package:app/utils/network_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        centerTitle: true,
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
            future: NetworkUtils().getVIPBannerList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List vipBannerList = snapshot.data;
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 270,
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
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
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
                          'images/ic_filter@3x.png',
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
                        'images/ic_question_mark_line_18px@3x.png',
                        fit: BoxFit.cover,
                        color: kBlackColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const VIPClassInfoPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0, 1);
                              const end = Offset.zero;
                              const curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child);
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: const Text(
                        'VIP클래스란',
                        style: TextStyle(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: NetworkUtils().getVIPClassList({
              'page': '0',
              'size': '20',
            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List classList = snapshot.data;
                //print(classList);
                return Column(
                  children: classList.map((e) {
                    VIPClass vipclass = VIPClass.fromJson(e);
                    if (selectedLocationList.isEmpty ||
                        selectedLocationList.contains(vipclass.stateAddress)) {
                      return VIPClassCardView(
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
