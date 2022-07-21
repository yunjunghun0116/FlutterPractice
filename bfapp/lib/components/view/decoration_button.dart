

import 'package:app/screens/shopping/components/custom_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecorationButton extends StatefulWidget {

  var title = '';
  final VoidCallback onTap;
  bool isGradient;

  DecorationButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isGradient = false,
  }) : super(key: key);

  @override
  _DecorationButtonState createState() => _DecorationButtonState();
}
class _DecorationButtonState extends State<DecorationButton> {

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 50,
        decoration: widget.isGradient ? customDecoration.gradientGoldDecoration()
            : customDecoration.borderBtnDecoration(Colors.black38),
        child: MaterialButton(
        onPressed: () {
          widget.onTap();
        },
          child: Text(widget.title,
          style: TextStyle(fontSize: 16, color: widget.isGradient ? Colors.white : Colors.black),
        ),
    ));
  }
}