import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'constants.dart';

class FeedTimeBottomSheet extends StatefulWidget {
  //시각 횟수 양
  @override
  _FeedTimeBottomSheetState createState() => _FeedTimeBottomSheetState();
}

class _FeedTimeBottomSheetState extends State<FeedTimeBottomSheet> {
  int feedMountPercent = 50;
  DateTime feedTime = DateTime.now();

  Widget _dateSettings() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.green.withOpacity(0.3)),
            ),
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
          Text('${feedMountPercent.toString()} %'),
          Slider(
            value: feedMountPercent.toDouble(),
            min: 0.0,
            max: 100.0,
            activeColor: Colors.green.withOpacity(0.3),
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
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.green.withOpacity(0.3)),
        ),
        onPressed: () {
          DateTime nextFeedTime = feedTime.add(
            Duration(hours: 9),
          );
          print(dateFormatting(nextFeedTime));
        },
        child: Text('식사시간추가하기'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 300,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _dateSettings(),
            _feedPercentSettings(),
            _feedButton(),
          ],
        ),
      ),
    );
  }
}
