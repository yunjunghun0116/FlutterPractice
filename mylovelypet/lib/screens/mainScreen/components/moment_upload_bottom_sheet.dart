import 'dart:io'; //File 사용
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controller/pet_controller.dart';
import '../../../../../controller/place_controller.dart';
import '../../../../../uploadFirebase/upload_firebase_storage.dart';
import '../../../../../components/constants.dart';

class MomentUploadBottomSheet extends StatefulWidget {
  @override
  _MomentUploadBottomSheetState createState() =>
      _MomentUploadBottomSheetState();
}

class _MomentUploadBottomSheetState extends State<MomentUploadBottomSheet> {
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

  UploadFirebaseStorage _firebaseStorage = UploadFirebaseStorage();

  Widget _dateSettings() {
    return Container(
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
            style: whiteButtonStyle,
            onPressed: () async {
              XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image == null) return;
              setState(() {
                _image = image;
                _imageFiles.add(_image!);
              });
            },
            child: Container(
              width: 100,
              child: Text(
                '이미지 추가하기',
                textAlign: TextAlign.center,
              ),
            ),
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
            style: whiteButtonStyle,
            onPressed: () {
              setState(() {
                isCommentAdd = !isCommentAdd;
              });
            },
            child: Container(
              width: 100,
              child: Text(
                '내용 입력하기',
                textAlign: TextAlign.center,
              ),
            ),
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
                child: Container(
                  child: Text(
                    '검색하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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

  Widget _findLocation() {
    if (isLocationFind) {
      return Positioned(
        child: Container(
          margin: EdgeInsets.all(30),
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Expanded(
                child: _findWithApi(),
              ),
              ElevatedButton(
                style: whiteButtonStyle,
                onPressed: () {
                  setState(() {
                    isLocationFind = !isLocationFind;
                  });
                },
                child: Container(
                  width: 100,
                  child: Text(
                    '선택 완료',
                    textAlign: TextAlign.center,
                  ),
                ),
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.blueGrey,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          '추억',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: commentController,
                          decoration: InputDecoration(
                            hintText: '추억에 대한 설명을 적어주세요~',
                          ),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              comments = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    comments,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  ),
                ),
                ElevatedButton(
                  style: whiteButtonStyle,
                  onPressed: () {
                    setState(() {
                      isCommentAdd = !isCommentAdd;
                    });
                  },
                  child: Container(
                    width: 100,
                    child: Text(
                      '작성완료',
                      textAlign: TextAlign.center,
                    ),
                  ),
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
          style: whiteButtonStyle,
          onPressed: () {
            setState(() {
              isLocationFind = !isLocationFind;
            });
          },
          child: Container(
            width: 100,
            child: Text(
              '지역설정하기',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _uploadMoment() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            style: whiteButtonStyle,
            onPressed: () async {
              setState(() {
                isUploading = !isUploading;
              });
              List<String> path = [];
              if (_imageFiles.isNotEmpty) {
                for (int i = 0; i < _imageFiles.length; i++) {
                  Future<String> downloadUrl = _firebaseStorage.uploadFile(
                      "images/${petController.petId}",
                      File(_imageFiles[i].path));
                  path.add(await downloadUrl);
                }
              }
              String togetherDate = dateFormattingWithYearAndMd(momentTime);
              var body = {
                'date': togetherDate,
                'imageUrl': path,
                'place': selectedLocation,
                'comment': comments,
                'timeStamp': momentTime,
              };
              await FirebaseFirestore.instance
                  .collection(petController.petId)
                  .doc('moment')
                  .collection('moment')
                  .add(body);
              Get.back();
            },
            child: Container(
              width: 100,
              child: Text(
                '추억 저장하기',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: basicColor,
      ),
      child: Stack(
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
      ),
    );
  }
}
