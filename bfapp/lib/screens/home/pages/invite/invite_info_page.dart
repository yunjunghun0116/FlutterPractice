import 'package:app/constants/constants_color.dart';
import 'package:app/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteInfoPage extends StatelessWidget {
  const InviteInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          '친구초대란?',
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
            width: double.infinity,
            child: Image.asset(imgFriendInvite),
          )
        ],
      ),
    );
  }
}
