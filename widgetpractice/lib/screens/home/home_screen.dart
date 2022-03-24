import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgetpractice/constants.dart';
import 'package:widgetpractice/screens/home/components/home_screen_first_location_select.dart';
import 'package:widgetpractice/screens/home/components/home_screen_second_location_select.dart';
import 'package:widgetpractice/screens/main/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _firstLocationList = [
    '대전',
    '충북',
    '충남/세종',
    '서울',
    '인천',
    '경기',
    '강원',
    '광주',
    '전북/전주',
    '전남',
    '대구',
    '울산',
    '부산',
    '경북'
  ];
  final List<String> _secondLocationList = [
    '대전과학기술대학교',
    '대전대학교',
    '목원대학교',
    '배재대학교',
    '우송대학교',
    '을지대학교 대전캠퍼스',
    '충남대학교',
    '한국과학기술대학교',
    '한남대학교',
    '한밭대학교'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Text(
          '학교설정',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: kWhiteColor,
        elevation: 0,
      ),
      body: Row(
        children: [
          HomeScreenFirstLocationSelect(
            list: _firstLocationList,
            currentIndex: 0,
          ),
          HomeScreenSecondLocationSelect(
            onPressed: (String str){
              print(str);
            },
            list: _secondLocationList,
          ),
        ],
      ),
    );
  }
}
