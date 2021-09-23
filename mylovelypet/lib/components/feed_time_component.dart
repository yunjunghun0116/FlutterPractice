import 'package:flutter/material.dart';
import 'package:mypetmoments/components/constants.dart';

class FeedTimeComponent extends StatefulWidget {
  final int index;
  final String feedDate;
  final String feedNextDate;
  bool isFinished;
  FeedTimeComponent(
      this.index, this.feedDate, this.feedNextDate, this.isFinished);

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
          onChanged: (value) {
            setState(() {
              //TODO 제대로 연결된 후에는 여기서 바꿔주는것이 아닌 서버에 바꾸라 요청해줄것임
              widget.isFinished = value!;
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
            widget.feedDate,
            style: feedTimeTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            widget.feedNextDate,
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
