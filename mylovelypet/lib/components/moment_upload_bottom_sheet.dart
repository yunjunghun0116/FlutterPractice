import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'constants.dart';

class MomentUploadBottomSheet extends StatefulWidget {
  //시간 장소 이미지 코멘트
  @override
  _MomentUploadBottomSheetState createState() =>
      _MomentUploadBottomSheetState();
}

class _MomentUploadBottomSheetState extends State<MomentUploadBottomSheet> {
  DateTime momentTime = DateTime.now();
  String selectedLocation = '';
  bool isLocationFind = false;

  Widget _dateSettings() {
    return Container(
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
                    momentTime = date;
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
            '함께한 시간 : ${dateFormatting(momentTime)}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _imageArea(){
    return Container(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(5, (index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/maltiz.jpeg'),
                  fit: BoxFit.fill,
                )
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _imageAddArea(){
    return Container(
      child: ElevatedButton(
        //TODO 이미지추가하는 함수 구현하기
        onPressed: (){},
        child: Text('이미지 추가하기'),
      ),
    );
  }

//TODO 공공api를 가져와서 화면에 출력해주고 선택할경우에 그 값을 리턴해주고 그 리턴된값을 띄우는형식
  Widget _findLocation() {
    if (isLocationFind) {
      return Positioned(
        child: Container(
          margin: EdgeInsets.all(30),
          height: 400,
          color: Colors.lightGreenAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLocationFind = !isLocationFind;
                    });
                  },
                  child: Text('선택완료')),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _dateSettings(),
                _imageArea(),
                _imageAddArea(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLocationFind = !isLocationFind;
                    });
                  },
                  child: Text('지역설정하기'),
                ),
              ],
            ),
          ),
        ),
        _findLocation(),
      ],
    );
  }
}
