import 'dart:collection';

import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/components/view/top_scroll_button.dart';
import 'package:app/controllers/shopping_controller.dart';
import 'package:app/icon.dart';
import 'package:app/models/shopping/shopping_detail_model.dart';
import 'package:app/utils/format_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../constants/constants_color.dart';
import '../../../models/shopping/shopping_list_model.dart';
import '../components/custom_decoration.dart';

class ShoppingDetailScreen extends StatefulWidget {
  const ShoppingDetailScreen({Key? key}) : super(key: key);

  @override
  _ShoppingDetailScreenState createState() => _ShoppingDetailScreenState();
}

class _ShoppingDetailScreenState extends State<ShoppingDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final CarouselController _controller = CarouselController();
  late final getController = Get.put(ShoppingController());
  ScrollController controller = ScrollController();
  ShoppingDetailData data = ShoppingDetailData();
  Content? argument;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    getController.setIndicatorIndex(0); //인디게이터 초기화
    getController.setExtendDetailViewValue(false);
    argument = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getController.resetShoppingDetailInfo();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
          title: '상품정보'
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: NestedScrollView(
                    controller: controller,
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverToBoxAdapter(
                          child: FutureBuilder(
                            future: _fetch(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return const SizedBox();
                              } else if (snapshot.hasError) {
                                return const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("ERROR"),
                                );
                              } else {
                                ShoppingDetailData? data = snapshot.data;
                                // data = snapshot.data;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CarouselSlider.builder(
                                        carouselController: _controller,
                                        itemCount:
                                        data!.detailImage!.length,
                                        itemBuilder: (BuildContext context,
                                            int index, id) {
                                          return Image.network(
                                              data.detailImage![index]
                                                  .toString(),
                                              fit: BoxFit.contain);
                                        },
                                        options: CarouselOptions(
                                          // enlargeCenterPage: true,
                                            height: 350,
                                            viewportFraction: 1,
                                            onPageChanged: (index, reason){
                                              getController.imageIndicatorIndex(index);
                                            }
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children:
                                      data.detailImage!.asMap().entries.map((entry) {
                                        return Obx(
                                                () => Container(
                                              width: 7.0,
                                              height: 7.0,
                                              margin: const EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: (Theme.of(context)
                                                      .brightness ==
                                                      Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                      .withOpacity(
                                                      getController.getIndicatorIndex == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                            )
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(
                                      height: 23.8,
                                    ),
                                    showContent(data),
                                    Container(
                                      height: 8,
                                      color: const Color(0xFFf8f8f8),
                                    ),
                                    showFindStore(),
                                    Container(
                                      height: 8,
                                      color: const Color(0xFFf8f8f8),
                                    ),
                                    TabBar(
                                        labelPadding: const EdgeInsets.only(top: 20),
                                        controller: _tabController,
                                        indicatorColor: kBfb4875eColor,
                                        labelColor: kBfb4875eColor,
                                        unselectedLabelColor: Colors.grey[400],
                                        tabs: const [
                                          SizedBox(
                                            height: 40,
                                            child: Text("상세정보"),
                                          ),
                                          SizedBox(
                                              height: 40,
                                              child: Text("배송/교환/반품")),
                                          SizedBox(
                                              height: 40, child: Text("후기")),
                                        ]),
                                    // showTabBarView(data)
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ];
                    },
                    body: Obx(() => getController.detailGetData.name == null ? const SizedBox() : showTabBarView(getController.detailGetData)),
                  )
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: argument!.soldout == false?
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                            height: 56,
                            decoration: argument!.rental!.rental == false ? customDecoration.gradientGoldDecoration()
                                : customDecoration.borderBtnDecoration(Colors.black38),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "구매하기",
                                style: TextStyle(fontSize: 16, color: argument!.rental!.rental == false ? Colors.white : Colors.black),
                              ),
                            )),
                      ),
                      argument!.rental!.rental == false ? const SizedBox() :
                      Expanded(
                        child: Container(
                            height: 56,
                            decoration: customDecoration.gradientGoldDecoration(),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "렌탙상담 신청",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            )),
                      ),
                    ],
                  )
                      : Expanded(
                    child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(color: Colors.grey[350]),
                        child: MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            "품절",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  )),
              TopScrollButton(controller: controller, bottomHeight: 60),
            ],
          ),),
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    //refresh contents
    // await _fetch();
    setState(() {

    });
  }

  showTabBarView(ShoppingDetailData? data){
    return Padding(padding: const EdgeInsets.only(bottom: 50),
    child: TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        showDetailInfoTab(data?.goodsInfo),
        showDeliveryInfoTab(data?.etcInfo),
        showReviewTab(),
      ],
    ),);
  }

  Future<ShoppingDetailData?> _fetch() async {
    // await Future.delayed(const Duration(milliseconds: 50));
    data = await NetworkUtils().getShoppingDetailInfo(
        argument!.id!);
    getController.saveShoppingDetailInfo(data);
    return data;
  }

  showContent(ShoppingDetailData data) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: Text(
              data.name.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          showRowText(data.price.toString(), false),
          showRowText(
              data.rental!.rentPrice == null
                  ? "0"
                  : data.rental!.rentPrice.toString(),
              true),
          showRatingStar(
              data.pointRatio!.toDouble(), data.usePointRatio!.toDouble()),
          const Divider(
            thickness: 1,
          ),
          showBenefit(data),
        ],
      ),
    );
  }

  showRowText(String price, bool rental) {
    print(price);
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: Row(
        children: [
          Text(
            getPrice(int.parse(price)),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(rental ? "원 / 렌탈가(월)" : "원 / 구매가",
              style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  showRatingStar(double ratingCount, double reviewCount) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: ratingCount,
            minRating: 0,
            direction: Axis.horizontal,
            // allowHalfRating: true,
            itemCount: 5,
            itemSize: 15,
            unratedColor: const Color(0xFFececec),
            ignoreGestures: true,
            glowColor: Colors.transparent,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 7,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            ratingCount.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            reviewCount.toString(),
            style: const TextStyle(color: Color(0xFFb4875e), fontSize: 12),
          ),
          const Text("건"),
          const Spacer(),
          Image.asset(
            "images/ic_heart_unsel.png",
            color: Colors.grey,
            width: 20,
          )
        ],
      ),
    );
  }

  showBenefit(ShoppingDetailData data) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '혜택',
                style: TextStyle(color: kbF8a8b8dColor),
              ),
              const SizedBox(width: 22),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data.benefits!.isNotEmpty ? Text(data.benefits![0].text.toString(), style: const TextStyle(color: kRedColor),) : const SizedBox(),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(const BorderSide(color: kBfb4875eColor))
                            ),
                            onPressed: () {},
                            child: const Text(
                              '제휴카드',
                              style: TextStyle(color: kBfb4875eColor),
                            ),
                          ),
                          flex: 1,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(const BorderSide(color: kBfb4875eColor))
                            ),
                            onPressed: () {},
                            child: const Text('무이자',
                                style: TextStyle(color: kBfb4875eColor)),
                          ),
                          flex: 1,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(const BorderSide(color: kBfb4875eColor))
                            ),
                            onPressed: () {},
                            child: const Text('선납금',
                                style: TextStyle(color: kBfb4875eColor)),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text("할인", style: TextStyle(color: kbF8a8b8dColor)),
              const SizedBox(width: 22),
              Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(color: kBff13e45Color))
                    ),
                onPressed: () {},
                child: const Text('할인쿠폰 보기',
                    style: TextStyle(color: kBff13e45Color)),
              ))
            ],
          ),
          Row(
            children: const [
              Text("배송", style: TextStyle(color: kbF8a8b8dColor)),
              SizedBox(width: 22),
              Text("배송비 무료(제주도 배송비 추가)")
            ],
          )
        ],
      ),
    );
  }

  showFindStore() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            Image.asset(
              "images/png/icon/shopping/Group 2919.png",
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "가까운 전시장 찾기",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "이 제품을 직접 체험해 보시려면?",
                  style: TextStyle(color: Color(0xFF8b634b)),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFFc5c7ca),
              size: 12,
            )
          ],
        ),
      ),
    );
  }

  showDetailInfoTab(String? goodsInfo) {
    String _htmlContent = goodsInfo.toString();
    double width = MediaQuery.of(context).size.width;
    return Obx(() =>
        ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(thickness: 5, color: kbtnLightGreyColor,),),
            getController.getExtendDetailView ?
            Html(data: _htmlContent)
                : SizedBox(
              height: 800,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Html(data: _htmlContent),
                  Positioned(
                    child: Container(
                      width: width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: OutlinedButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
                            ),
                            onPressed: () => getController.setExtendDetailViewValue(true),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('상품정보 더보기', style: TextStyle(
                                    color: Colors.black
                                ),),
                                const SizedBox(width: 5,),
                                Image.asset(icArrowDown10px, width: 13,)
                              ],
                            )
                        ),
                      ),
                    ),
                    bottom: 0,)
                ],
              ),
            ),
          ],
        )
    );
  }

  showDeliveryInfoTab(List<String>? etcInfo) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(thickness: 5, color: kbtnLightGreyColor,),),
          Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text("1:1문의", style: TextStyle(color: Colors.black),),
            ),
          ),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('상품 관련하여 궁금하신 점을 문의해 주세요.'),
              const Text(
                '작성해주신 문의내역 및 답변은',
                style: TextStyle(color: kGreyColor),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: '마이페이지>1:1문의내역 ',
                        style: TextStyle(color: kMainColor)
                    ),
                    TextSpan(text: '메뉴에서 확인 가능합니다.', style: TextStyle(color: kGreyColor))
                  ]
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(thickness: 5, color: kbtnLightGreyColor,),),
          etcInfo != null ? Padding(padding: EdgeInsets.fromLTRB(15, 5, 15, 5), child: Image.network(etcInfo[0]),) : const SizedBox()
        ],
      ),
    );
  }

  showReviewTab(){
    return ListView(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(thickness: 5, color: kbtnLightGreyColor,),),
        Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
          padding: EdgeInsets.all(5),
          color: kBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // showRatingStar(data.pointRatio!.toDouble(), data.usePointRatio!.toDouble()),
              Text('0.0')
            ],
          ),
        ),)
      ],
    );
  }
}
