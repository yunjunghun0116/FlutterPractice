import 'package:bodyfriend_clone/components/massage_chair_card.dart';
import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/chair_controller.dart';
import 'package:bodyfriend_clone/screens/home/components/carousel_area.dart';
import 'package:bodyfriend_clone/screens/home/components/custom_icon_area.dart';
import 'package:bodyfriend_clone/screens/home/components/top_login_button.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../models/chair.dart';

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
      body: ListView(
        children: [
          const TopLoginButton(),
          const CustomIconArea(),
          const CarouselArea(),
          Container(
            width: double.infinity,
            height: 10,
            color: kBackgroundColor,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '프랜드몰',
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '더보기 +',
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '10년 더 건강하게 바디프랜드',
                  style: TextStyle(
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<ChairController>(
            builder: (_) {
              return SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ChairController.to.chairList.map((Chair chair) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 10),
                        MassageChairCard(
                          chair: chair,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: kMainColor,
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            onTap: () {
              ChairController.to.getChairList();
            },
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
