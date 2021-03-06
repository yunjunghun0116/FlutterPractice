import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/enum/enum.dart';
import 'package:app/screens/mybf/pages/coupon_page.dart';
import 'package:app/screens/mybf/pages/grade_page.dart';
import 'package:app/screens/mybf/pages/order_page.dart';
import 'package:app/screens/mybf/pages/point_page.dart';
import 'package:app/screens/shopping/components/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MybfScreen extends StatefulWidget {
  const MybfScreen({Key? key}) : super(key: key);

  @override
  _MybfScreenState createState() => _MybfScreenState();
}

class _MybfScreenState extends State<MybfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
          title: 'MY BF',
          type: NavigationType.main,
          buttonTypes: const [
            NavigationButtonType.grade,
            NavigationButtonType.notification
          ]
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: customDecoration.gradientGoldDecoration(),
                    child: const Align(
                      alignment: Alignment.topCenter,
                    ),
                    width: 450,
                    height: 150,
                  ),
                  Positioned(
                    right: 30,
                    top: 18,
                    child: customerInfo(),
                  )
                ],
              ),
              orderSearch(),
              const Divider(
                thickness: 3,
              ),
              useSetting(),
              const Divider(
                thickness: 3,
              ),
              csIssue(),
              const Divider(
                thickness: 3,
              ),
              moreInfo()
            ],
          )
        ],
      ),
    );
  }

  Widget settingTitle({required String groupTitle}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 30.0, 8.0, 8.0),
        child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            groupTitle,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          )
        ]),
      ),
    );
  }

  Widget settingContent(String title, String key, String value) {
    return Container(
      child: ListTile(
        onTap: () async {
          Get.toNamed(key);
        },
        title: Text(title),
        trailing: SizedBox(
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderSearch() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingContent('??????/?????? ??????', 'order', ''),
        orderList(),
      ],
    );
  }

  Widget useSetting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingContent('????????????', 'review', ''),
        const Divider(
          thickness: 1,
        ),
        settingContent('????????????', 'favorite', ''),
        const Divider(
          thickness: 1,
        ),
        settingContent('??????????????????', 'easypayment', ''),
      ],
    );
  }

  Widget csIssue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingTitle(groupTitle: '??? ????????????'),
        settingContent('1:1 ??????', 'ask', ''),
        const Divider(
          thickness: 1,
        ),
        settingContent('???????????????', 'service', ''),
        const Divider(
          thickness: 1,
        ),
        settingContent('??????/?????? ??????', 'move', ''),
        const Divider(
          thickness: 1,
        ),
        settingContent('??????/?????? ??????', 'disperse', ''),
      ],
    );
  }

  Widget moreInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingContent('??????????????????', 'modification', ''),
        const Divider(
          thickness: 1,
        ),
        settingContent('??????', 'setting', ''),
      ],
    );
  }

  rightTextContent(String title, Widget contents, String key) {
    return Container(
      child: ListTile(
        onTap: () {
          Get.toNamed(key);
        },
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        trailing: Container(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              contents,
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  orderList() {
    return Align(
        alignment: Alignment.center,
        child: Container(
          width: 330,
          height: 80,
           color: Color(0xFFEEEEEE), //light grey
          child: TextButton(
            onPressed: (){
              Get.to(OrderPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                orderTitle('??????/??????'),
                orderTitle('?????????'),
                orderTitle('????????????'),
                orderTitle('????????????'),
                orderTitle('??????/??????'),
              ],
            ),
          ),

    )
    );
  }

  orderTitle(String s) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('0', style: TextStyle(color: Colors.black12,fontSize: 21)),
        Text(s, style: TextStyle(color: Colors.black87,fontSize: 12),)
      ],
    );
  }

  customerInfo() {
    return Container(
      width: 330,
      height: 115,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('   Customer'),
              TextButton(onPressed: () {Get.to(PointPage());},
                  child: Text('0P',style: TextStyle(color: Colors.black),))
            ],
          ),
          const Divider(
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () {
                Get.to(const CouponPage());
              },
                  child: Text('??????',style: TextStyle(color: Colors.black87),)),

              TextButton(
                onPressed: () {},
                child: Text('????????? ??????',style: TextStyle(color: Colors.black87),),
              )
            ],
          )
        ],
      ),
    );
  }
}
