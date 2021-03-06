import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class FeedTimeComponent extends StatefulWidget {
  final String petId;
  final String id;
  final String feedPrevDate;
  final String feedNextDate;
  final bool isFinished;
  FeedTimeComponent(this.petId, this.id, this.feedPrevDate, this.feedNextDate,
      this.isFinished);

  @override
  State<FeedTimeComponent> createState() => _FeedTimeComponentState();
}

class _FeedTimeComponentState extends State<FeedTimeComponent> {
  @override
  Widget build(BuildContext context) {
    bool isFinished = widget.isFinished;
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: CheckboxListTile(
        title: Text(
          dateFormattingWithMdh(widget.feedNextDate),
          style: widget.isFinished ? feedTimeSelected : feedTimeTextStyle,
        ),
        secondary: Icon(Icons.food_bank),
        value: isFinished,
        onChanged: (value) async{
          if(!widget.isFinished){
            await FirebaseFirestore.instance
                .collection(widget.petId)
                .doc('feedTime')
                .collection('time')
                .doc(widget.id)
                .update({'isFinished': true});
            setState(() {
             isFinished = true;
            });
          }
        },
      ),
    );
  }
}
