import 'package:app/constants/constants.dart';
import 'package:app/constants/constants_color.dart';
import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  final int selectedIndex;
  final int currentIndex;
  final Function onPressed;

  const TimeButton(
      {Key? key,
      required this.selectedIndex,
      required this.onPressed,
      required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: currentIndex != 0
                    ? currentIndex == selectedIndex
                        ? kMainColor
                        : kGreyColor
                    : kGreyColor,
                borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(
            width: 20,
            child: currentIndex != 0
                ? Divider(
                    color:
                        currentIndex == selectedIndex ? kMainColor : kGreyColor,
                    thickness: 1,
                  )
                : Container(),
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              border: currentIndex != 0
                  ? Border.all(
                      color: currentIndex == selectedIndex
                          ? kMainColor
                          : kGreyColor)
                  : null,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${currentIndex * 10}분',
              style: TextStyle(
                fontSize: 16,
                color: currentIndex == 0
                    ? kGreyColor
                    : currentIndex == selectedIndex
                        ? kMainColor
                        : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
