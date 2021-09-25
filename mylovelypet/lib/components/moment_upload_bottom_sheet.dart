import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mypetmoments/controller/pet_controller.dart';
import 'package:mypetmoments/controller/place_controller.dart';

import 'constants.dart';

class MomentUploadBottomSheet extends StatefulWidget {
  //시간 장소 이미지 코멘트
  @override
  _MomentUploadBottomSheetState createState() =>
      _MomentUploadBottomSheetState();
}

class _MomentUploadBottomSheetState extends State<MomentUploadBottomSheet> {

  FirebaseStorage _storage = FirebaseStorage.instance;

  final petController = Get.put(PetController());
  final controller = Get.put(PlaceController());
  DateTime momentTime = DateTime.now();
  String selectedLocation = '';
  String comments = '';
  bool isLocationFind = false;
  bool isCommentAdd = false;
  bool isUploading = false;

  final placeController = TextEditingController();
  final commentController = TextEditingController();

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
      margin: EdgeInsets.all(10),
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _imageFiles.map((e) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Image.file(File(e.path)),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _imageAddArea() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            style: greenButtonStyle,
            //TODO 이미지추가하는 함수 구현하기
            onPressed: () async {
              XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image == null) return;
              setState(() {
                _image = image;
                _imageFiles.add(_image!);
              });
            },
            child: Text('이미지 추가하기'),
          ),
        ],
      ),
    );
  }

  Widget _commentAdd() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            style: greenButtonStyle,
            //TODO 이미지추가하는 함수 구현하기
            onPressed: () {
              setState(() {
                isCommentAdd = !isCommentAdd;
              });
            },
            child: Text('내용 입력하기'),
          ),
        ],
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
                onPressed: () async {
                  await controller.getList(placeController.text);
                },
                child: Text('검색하기'),
              ),
            ],
          ),
          Text(selectedLocation),
        ],
      ),
    );
  }

  Widget _findResultArea() {
    return Obx(() {
      return Container(
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: controller.placeList.map((element) {
              return Column(
                children: List.generate(element.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLocation = element[index]['title'];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              element[index]['title'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }).toList(),
          ),
        ),
      );
    });
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
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _findWithApi(),
              ),
              ElevatedButton(
                style: greenButtonStyle,
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

  Widget _commentWriteArea() {
    if (isCommentAdd) {
      return Positioned(
        child: Container(
          margin: EdgeInsets.all(30),
          height: 400,
          color: Colors.grey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('추억에 대한 설명 작성하기'),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: commentController,
                        onChanged: (value) {
                          setState(() {
                            comments = value;
                          });
                        },
                      ),
                      Text(comments),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: greenButtonStyle,
                  onPressed: () {
                    setState(() {
                      isCommentAdd = !isCommentAdd;
                    });
                  },
                  child: Text('작성완료'),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _settingPlace() {
    return Column(
      children: [
        Text(selectedLocation),
        ElevatedButton(
          style: greenButtonStyle,
          onPressed: () {
            setState(() {
              isLocationFind = !isLocationFind;
            });
          },
          child: Text('지역설정하기'),
        ),
      ],
    );
  }

  Widget _uploadMoment() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            style: greenButtonStyle,
            onPressed: () async {
              setState(() {
                isUploading = !isUploading;
              });
              List<Future<String>> path = [];
              if (_imageFiles.isNotEmpty) {
                Reference _fileReference =
                    _storage.ref().child("${petController.petId}/images");
                _imageFiles.map((element) async {
                  var response =
                      await _fileReference.putFile(File(element.path));
                  Future<String> downloadUrl = response.ref.getDownloadURL();
                  path.add(downloadUrl);
                });
              }

              String togetherDate = dateFormattingWithYearAndMd(momentTime);
              var body = {
                'date': togetherDate,
                'imageUrl': path,
                'place': selectedLocation,
                'comment': comments,
              };
              await FirebaseFirestore.instance
                  .collection(petController.petId)
                  .doc('moment')
                  .collection('${momentTime}_${DateTime.now()}')
                  .add(body);
              Get.back();
            },
            child: Text('추억 저장하기'),
          ),
        ],
      ),
    );
  }

  Widget _mainSheet() {
    if (isUploading) {
      return CircularProgressIndicator();
    } else {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _dateSettings(),
                  _imageArea(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _imageAddArea(),
                      _commentAdd(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _settingPlace(),
                      _uploadMoment(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          _findLocation(),
          _commentWriteArea(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _mainSheet(),
    );
  }
}
