

import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {

  var title = "";

  DropDownButton({Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Image.asset("images/ic_arrow_down_10px@2x.png")
      ],
    );
  }
}