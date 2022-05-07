import 'package:bodyfriend_clone/constants.dart';
import 'package:flutter/material.dart';

class SleepButton extends StatelessWidget {
  final String iconSrc;
  final String title;
  final Function onPressed;
  final String? value;
  const SleepButton({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.onPressed, this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,0),
            blurRadius:10,
            color: Colors.black26
          ),
        ]
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(iconSrc),
          ),
          const SizedBox(width: 10),
          Text(title),
          const Spacer(),
          Text(value??'0',style: const TextStyle(),)
        ],
      ),
    );
  }
}
