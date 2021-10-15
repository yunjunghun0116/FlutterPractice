import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/constants.dart';

class DeleteBottomSheet extends StatefulWidget {
  final String petId;
  final String momentId;
  DeleteBottomSheet(this.petId, this.momentId);

  @override
  State<DeleteBottomSheet> createState() => _DeleteBottomSheetState();
}

class _DeleteBottomSheetState extends State<DeleteBottomSheet> {
  
  bool isDelete = false;


  Widget deleteMain(){
    if(isDelete){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Text('삭제하시겠습니까?'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.red.withOpacity(0.5)),
                ),
                onPressed: () async {
                  setState(() {
                    isDelete = true;
                  });
                  await FirebaseFirestore.instance
                      .collection(widget.petId)
                      .doc('moment')
                      .collection('moment')
                      .doc(widget.momentId)
                      .delete();
                  Get.offAllNamed('/main');
                },
                child: Container(
                  child: Text('예'),
                ),
              ),
              ElevatedButton(
                style: whiteButtonStyle,
                onPressed: () {
                  Get.back();
                },
                child: Container(
                  child: Text('아니요'),
                ),
              ),
            ],
          )
        ],
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: basicColor,
      ),
      child: deleteMain(),
    );
  }
}
