import 'package:flutter/material.dart';

class FeedTimeComponent extends StatelessWidget {
  final String feedDate;
  final String feedNextDate;
  FeedTimeComponent(this.feedDate, this.feedNextDate);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(feedDate),
        Text(feedNextDate),
      ],
    );
  }
}
