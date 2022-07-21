import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/enum/enum.dart';
import 'package:app/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VIPClassInfoPage extends StatelessWidget {
  const VIPClassInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("check");
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: NavigationBarView(
          title: 'VIP클래스란?',
          type: NavigationType.close
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(imgVipClass),
          ),
        ],
      ),
    );
  }
}
