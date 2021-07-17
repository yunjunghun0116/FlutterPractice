import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      //그림자효과
      elevation: 10.0,
      disabledElevation: 10.0,
      //shape에서 roundedRectangleBorder-borderRadius와 같이 모양을 마음대로설정가능
      shape: CircleBorder(),
      fillColor: buttonBackgroundColor,
      //size와 같다.
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}