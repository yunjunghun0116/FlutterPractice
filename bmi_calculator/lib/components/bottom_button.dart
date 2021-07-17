import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final Function onPressedFunc;
  final String buttonText;
  BottomButton({@required this.onPressedFunc,@required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomContainerColor,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: bottomContainerHeight,
      padding: EdgeInsets.only(bottom: 20.0),
      child: TextButton(
        onPressed: onPressedFunc,
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}