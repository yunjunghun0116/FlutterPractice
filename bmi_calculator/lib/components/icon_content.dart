import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData contentIcon;
  final String contentLabel;

  IconContent({@required this.contentIcon, @required this.contentLabel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          contentIcon,
          size: 100.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          contentLabel,
          style: contentLabelStyle,
        )
      ],
    );
  }
}
