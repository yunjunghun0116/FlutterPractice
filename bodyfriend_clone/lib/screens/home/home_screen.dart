import 'package:bodyfriend_clone/components/massage_chair_card.dart';
import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/screens/home/components/carousel_area.dart';
import 'package:bodyfriend_clone/screens/home/components/custom_icon_area.dart';
import 'package:bodyfriend_clone/screens/home/components/top_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kSubBlackColor,
        title: const Text(
          'BODYFRIEND',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
          RaisedButton(onPressed: (){}),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 10),
                MassageChairCard(
                  widgetWidth: 130,
                  imageUrl: 'assets/images/image_1.jpeg',
                  title: '팬텀메디컬케어\n(제이드그린)',
                  price: '5,800,000',
                  rentalPrice: '99,500',
                ),
                SizedBox(width: 10),
                MassageChairCard(
                  widgetWidth: 130,
                  imageUrl: 'assets/images/image_2.jpeg',
                  title: '더팬텀(카카오화이트)',
                  price: '5,400,000',
                  rentalPrice: '94,500',
                ),
                SizedBox(width: 10),
                MassageChairCard(
                  widgetWidth: 130,
                  imageUrl: 'assets/images/image_3.jpeg',
                  title: '더팬텀(블레이징블랙)',
                  price: '5,400,000',
                  rentalPrice: '94,500',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: kMainColor,
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            onTap: (){
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
