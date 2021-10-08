import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/delete_bottom_sheet.dart';
import '../../components/constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  String petId = '';
  String momentId = '';
  String imageUrl = '';
  String comment = '';
  String date = '';
  @override
  void initState() {
    super.initState();
    var momentData = Get.arguments;
    petId = momentData['petId'];
    momentId = momentData['id'];
    imageUrl = momentData['imageUrl'];
    comment = momentData['comment'];
    date = momentData['date'];
  }

  Widget _momentImage(double height, String url) {
    double image_height = height / 2;
    if (url == noImageUrl) {
      return Container(
        height: image_height,
        color: Colors.grey.withOpacity(0.2),
        child: Center(
          child: Text('No Image'),
        ),
      );
    } else {
      return Container(
        height: image_height,
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
      );
    }
  }

  Widget _momentComment(String comment) {
    return Container(
      margin: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('추억에 대한 설명',style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 20,
            ),
            Text(comment),
          ],
        ),
      ),
    );
  }

  Widget _momentEditArea() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.green.withOpacity(0.5)),
            ),
            //TODO 수정하기 기능 추가하기.
            onPressed: () {
              //TODO 버튼클릭시 bottomSheet 올려준후에
              //TODO 바텀시트에서 설명 수정할 수 있도록 기능추
            },
            child: Container(
              width: 100,
              child: Text(
                '수정하기',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.red.withOpacity(0.5)),
            ),
            onPressed: ()  {
              Get.bottomSheet(DeleteBottomSheet(petId,momentId));
            },
            child: Container(
              width: 100,
              child: Text(
                '삭제하기',
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: basicColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _momentImage(height, imageUrl),
              _momentComment(comment),
              Spacer(),
              _momentEditArea(),
            ],
          ),
          SafeArea(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
