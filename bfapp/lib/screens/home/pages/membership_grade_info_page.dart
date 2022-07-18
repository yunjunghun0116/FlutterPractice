import 'package:app/constants/constants_color.dart';
import 'package:app/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MembershipGradeInfoPage extends StatefulWidget {
  const MembershipGradeInfoPage({Key? key}) : super(key: key);

  @override
  _MembershipGradeInfoPageState createState() =>
      _MembershipGradeInfoPageState();
}

class _MembershipGradeInfoPageState extends State<MembershipGradeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          '등급 안내',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            // width: double.infinity,
            // height: MediaQuery.of(context).size.height,
            child: Image.asset(
              imgMenbership,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
