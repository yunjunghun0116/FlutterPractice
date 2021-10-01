import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

class FeedTimeComponent extends StatefulWidget {
  String petId;
  String id;
  String feedPrevDate;
  String feedNextDate;
  bool isFinished;
  FeedTimeComponent(this.petId, this.id, this.feedPrevDate, this.feedNextDate,
      this.isFinished);

  @override
  State<FeedTimeComponent> createState() => _FeedTimeComponentState();
}

class _FeedTimeComponentState extends State<FeedTimeComponent> {
  Widget isFinishedCheckbox(bool finish) {
    if (!finish) {
      return Container(
        height: 30,
        child: Checkbox(
          value: widget.isFinished,
          onChanged: (value)async {
            await FirebaseFirestore.instance
                .collection(widget.petId)
                .doc('feedTime')
                .collection('time')
                .doc(widget.id)
                .update({'isFinished': true});
            setState(() {
              widget.isFinished = true;
            });
          },
        ),
      );
    }
    return Container(
      height: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Text(
            dateFormattingWithMdh(widget.feedPrevDate) ,
            style: feedTimeTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            dateFormattingWithMdh(widget.feedNextDate) ,
            style: widget.isFinished ? feedTimeSelected : feedTimeTextStyle,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isFinishedCheckbox(widget.isFinished),
            ],
          ),
        )
      ],
    );
  }
}
