import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/enum/enum.dart';
import 'package:app/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeRecordInfoPage extends StatelessWidget {
  const TimeRecordInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
          title: '참여방법',
          type: NavigationType.close
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(imgHowToMassageTime),
          )
        ],
      ),
    );
  }
}
