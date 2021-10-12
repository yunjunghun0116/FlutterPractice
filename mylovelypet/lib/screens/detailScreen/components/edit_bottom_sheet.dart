import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/constants.dart';

class EditBottomSheet extends StatefulWidget {
  final String comment;
  final String petId;
  final String momentId;
  final double width;
  EditBottomSheet(this.comment, this.petId, this.momentId, this.width);

  @override
  _EditBottomSheetState createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet> {
  bool isEditing = false;
  String editNewText = '';

  TextEditingController commentEditController = TextEditingController();

  @override
  initState() {
    super.initState();
    editNewText = widget.comment;
    commentEditController.text = widget.comment;
  }

  Widget editArea(double width) {
    if (isEditing) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                '설명 수정하기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 40),
                  width: width,
                  child: TextField(
                    controller: commentEditController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(hintText: '추억'),
                    onChanged: (text) {
                      setState(() {
                        editNewText = text;
                      });
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        editNewText = '';
                        commentEditController.text = '';
                      });
                    },
                    icon: Icon(
                      Icons.refresh_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 30,
                    right: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      editNewText,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.green.withOpacity(0.7),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    isEditing = true;
                  });
                  var body = {'comment': editNewText};
                  await FirebaseFirestore.instance
                      .collection(widget.petId)
                      .doc('moment')
                      .collection('moment')
                      .doc(widget.momentId)
                      .update(body);
                  Get.toNamed('/main');
                },
                child: Container(
                  width: 100,
                  child: Text(
                    '수정하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _textEditAreaWidth = widget.width * 0.8;
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: basicColor,
      ),
      child: editArea(_textEditAreaWidth),
    );
  }
}
