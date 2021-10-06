import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/constants.dart';
import 'feed_time_bottom_sheet.dart';
import 'moment_upload_bottom_sheet.dart';

class AddArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.deepPurpleAccent.withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AddButton('식사시간',(){
            Get.bottomSheet(FeedTimeBottomSheet());
          }),
          AddButton('추억',(){
            Get.bottomSheet(MomentUploadBottomSheet());
          }),

        ],
      ),
    );
  }
}
class AddButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  AddButton(this.text,this.onPressed);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: whiteButtonStyle,
      onPressed: () {
        onPressed();
      },
      child: Container(
        width: 60,
        child: Text(text),
        alignment: Alignment.center,
      ),
    );
  }
}
