import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import '../../../../../uploadFirebase/upload_firebase_firestore.dart';
import '../../../../../controller/pet_controller.dart';
import '../../../../../components/constants.dart';

class FeedTimeBottomSheet extends StatefulWidget {
  //시각 횟수 양
  @override
  _FeedTimeBottomSheetState createState() => _FeedTimeBottomSheetState();
}

class _FeedTimeBottomSheetState extends State<FeedTimeBottomSheet> {
  PetController? controller = Get.put(PetController());
  UploadFirebaseStore _firebaseStore = UploadFirebaseStore();

  int feedMountPercent = 50;
  DateTime feedTime = DateTime.now();

  Widget _dateSettings() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          ElevatedButton(
            style: whiteButtonStyle,
            onPressed: () {
              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                currentTime: DateTime.now(),
                minTime: DateTime(2021, 1, 1),
                maxTime: DateTime(2023, 12, 31),
                onConfirm: (date) {
                  setState(() {
                    feedTime = date;
                  });
                },
                locale: LocaleType.ko,
              );
            },
            child: Text(
              '날짜설정하기',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '밥준시간 : ${dateFormatting(feedTime)}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _feedPercentSettings() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        children: [
          Text('밥 양 : ${feedMountPercent.toString()} %'),
          Slider(
            value: feedMountPercent.toDouble(),
            min: 0.0,
            max: 100.0,
            activeColor: Colors.white.withOpacity(0.5),
            inactiveColor: Colors.grey.withOpacity(0.3),
            onChanged: (double newValue) {
              setState(() {
                feedMountPercent = newValue.round();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _feedButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: whiteButtonStyle,
        onPressed: () async {
          DateTime nextFeedTime = feedTime.add(
            Duration(hours: 9),
          );
          var body = {
            'previousTime': '$feedTime',
            'futureTime': '$nextFeedTime',
            'isFinished': false,
          };
          await _firebaseStore.uploadFeedTime(controller!.petId, body);
          Get.back();
        },
        child: Text('식사시간추가하기'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: basicColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _dateSettings(),
          _feedPercentSettings(),
          _feedButton(),
        ],
      ),
    );
  }
}
