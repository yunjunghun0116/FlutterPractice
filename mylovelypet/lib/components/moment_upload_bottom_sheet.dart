import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

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

  final placeController = TextEditingController();

  List<XFile> _imageFiles = [];
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

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

  Widget _imageArea() {
    return Container(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _imageFiles.map((e) {
            return Container(
              child: Image.file(File(e.path)),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _imageAddArea() {
    return Container(
      child: ElevatedButton(
        //TODO 이미지추가하는 함수 구현하기
        onPressed: () async {
          XFile? image = await _picker.pickImage(source: ImageSource.gallery);
          if (image == null) return;
          setState(() {
            _image = image;
            _imageFiles.add(_image!);
          });
        },
        child: Text('이미지 추가하기'),
      ),
    );
  }

  Widget _findInputArea() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: Column(
        children: [
          Text('검색할 장소'),
          TextField(
            controller: placeController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('검색하기'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _findResultArea(){
    return Container(
      color: Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          children: [Text('12313213'),],
        ),
      ),
    );
  }

  Widget _findWithApi() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _findInputArea(),
            _findResultArea(),
          ],
        ),
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
            children: [
              Expanded(
                child: _findWithApi(),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLocationFind = !isLocationFind;
                  });
                },
                child: Text('선택완료'),
              ),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
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
      ),
    );
  }
}
