import 'package:bodyfriend_clone/constants.dart';
import 'package:flutter/material.dart';

class SleepButton extends StatelessWidget {
  final String iconSrc;
  final String title;
  final Function onPressed;
  final String value;
  const SleepButton({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.onPressed,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(color: kWhiteColor, boxShadow: [
          BoxShadow(
              offset: Offset(0, 0), blurRadius: 10, color: Colors.black26),
        ]),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(iconSrc),
            ),
            const SizedBox(width: 10),
            Text(title),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                color: value == '선택' ? kGreyColor : kMainColor,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 12,
              height: 12,
              child: Image.asset(
                'assets/memberships/ic_arrow_down_12px@3x.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
