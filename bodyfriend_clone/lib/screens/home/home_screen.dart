import 'package:bodyfriend_clone/components/massage_chair_card.dart';
import 'package:bodyfriend_clone/components/point_item_card.dart';
import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/point_item/point_item.dart';
import 'package:bodyfriend_clone/screens/home/components/carousel_area.dart';
import 'package:bodyfriend_clone/screens/home/components/custom_icon_area.dart';
import 'package:bodyfriend_clone/screens/home/components/mall_container.dart';
import 'package:bodyfriend_clone/screens/home/components/top_login_button.dart';
import 'package:bodyfriend_clone/screens/home/components/top_user_button.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../models/chair/chair.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kSubBlackColor,
        title: Image.asset(
          'assets/memberships/ic_logo_fill_ver@3x.png',
          fit: BoxFit.cover,
          height: 30,
        ),
        centerTitle: true,
        actions: [
          const Icon(Icons.alarm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(Icons.question_mark),
          ),
        ],
      ),
      body: GetBuilder<UserController>(
        builder: (controller) {
          return ListView(children: [
            controller.user != null
                ? const TopUserButton()
                : const TopLoginButton(),
            const CustomIconArea(),
            const CarouselArea(),
            FutureBuilder(
              future: controller.user != null
                  ? NetworkUtils().getMemberMainList(
                      controller.user!.id, controller.user!.accessToken)
                  : NetworkUtils().getMainList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //데이터를 제대로 받았을때, 데이터 수신중일때, 제대로 받지 못했을때
                if (snapshot.hasData) {
                  List mainList = snapshot.data;
                  return Column(
                    children: mainList.map((mainItem) {
                      if(mainItem['goodsList'].isEmpty){
                        return Container();
                      }
                      return MallContainer(
                        goodsList: mainItem['goodsList'],
                        title: mainItem['title'],
                        description: mainItem['description'],
                      );
                    }).toList(),
                  );
                }
                return Container();
              },
            )
          ]);
        },
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: kMainColor,
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            onTap: () {},
            child: const Text(
              '정품\n등록',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
          SpeedDialChild(
            child: const Text(
              '분해\n조립',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
          SpeedDialChild(
            child: const Text(
              '이전\n설치',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
          SpeedDialChild(
            child: const Text(
              'A/S\n접수',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
        ],
      ),
    );
  }
}
