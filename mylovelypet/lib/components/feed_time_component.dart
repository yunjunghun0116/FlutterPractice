import 'package:flutter/material.dart';
import 'package:mypetmoments/components/style_components.dart';

class FeedTimeComponent extends StatefulWidget {
  final int index;
  final String feedDate;
  final String feedNextDate;
  FeedTimeComponent(this.index,this.feedDate, this.feedNextDate);

  @override
  State<FeedTimeComponent> createState() => _FeedTimeComponentState();
}

class _FeedTimeComponentState extends State<FeedTimeComponent> {
  bool finished = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.feedDate,
          style: feedTimeTextStyle,
        ),
        Text(
          widget.feedNextDate,
          style: finished?feedTimeSelected:feedTimeTextStyle,
        ),
        Checkbox(
          value: finished,
          onChanged: (value) {
            setState(() {
              finished = value!;
            });
          },
        ),
      ],
    );
  }
}
