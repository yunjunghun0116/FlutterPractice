import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetmoments/components/feed_time_bottom_sheet.dart';
import 'package:mypetmoments/components/moment_upload_bottom_sheet.dart';
import 'package:mypetmoments/components/pet_image_component.dart';
import '../components/feed_time_component.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _feedTimeArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(100, (index) {
            return FeedTimeComponent(
                index, '$index일 1시 2분', '$index일 9시 2분', false);
          }),
        ),
      ),
    );
  }

  Widget _petImageArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(30, (index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed('/detail/$index', arguments: {
                  'imageUrl': 'assets/images/duri.png',
                  'comment': '여기는 추억에 담긴 내용',
                  'date': '여기는 추억이 담긴 날짜',
                });
              },
              child: PetImageComponent(
                'assets/images/duri.png',
                '여기는 추억에 담긴 내용여기는 추억에 담긴 내용여기는 추억에 담긴 내용여기는 추억에 담긴 내용',
                '2021 9/23 19:21',
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _addArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black45),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              Get.bottomSheet(FeedTimeBottomSheet());
            },
            child: Container(
              width: 60,
              child: Text('식사시간'),
              alignment: Alignment.center,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black45),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              Get.bottomSheet(MomentUploadBottomSheet());
            },
            child: Container(
              width: 60,
              child: Text('추억'),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        '두리의모먼트',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _feedTimeArea(),
            _petImageArea(),
            _addArea(),
          ],
        ),
      ),
    );
  }
}
