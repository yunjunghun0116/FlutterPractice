import 'package:flutter/material.dart';

const contentLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

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