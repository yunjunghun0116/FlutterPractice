
import 'package:app/constants/constants_color.dart';
import 'package:app/enum/enum.dart';
import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {

  var title = '';
  final Function(bool isSelected) onTap;
  FilterType filterType;
  bool isSelected;

  SelectionButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.filterType = FilterType.multi,
    this.isSelected = false,
  }) : super(key: key);

  @override
  _SelectionButtonState createState() => _SelectionButtonState();
}
  class _SelectionButtonState extends State<SelectionButton> {

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 4),
              child: OutlinedButton(
                onPressed: () {
                  // 한개 필수타입 인 경우 선택 해제 막음
                  if (isMustType() && widget.isSelected) return;
                  widget.isSelected = !widget.isSelected;
                  setState(() {
                    widget.onTap(widget.isSelected);
                  });
                },
                child: Text(widget.title),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  primary: isMultiType()
                      ? (isSelected() ? kMainColor : kBlackColor)
                      : (isSelected() ? kWhiteColor : kBlackColor),
                  backgroundColor: isMultiType()
                      ? kWhiteColor
                      : isSelected() ? kMainColor : kbtnLightGreyColor,
                  textStyle: isSelected()
                      ? const TextStyle(fontWeight: FontWeight.w500)
                      : const TextStyle(fontWeight: FontWeight.normal),
                  side: isSelectedMultiType()
                      ? const BorderSide(width: 1.5, color: kMainColor)
                      : const BorderSide(width: 1, color: kbtnLightGreyColor),
                ),
              )),
          Positioned(
              right: 0,
              top: 0,
              child: Visibility(
                visible: isSelectedMultiType(),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(8),
                    color: kMainColor,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 12,
                    color: kWhiteColor,
                  ),
                ),
              )
          )
        ]
    );
  }

  // 선택 여부
  bool isSelected() {
    return widget.isSelected;
  }

  // 한개 필수 타입
  bool isMustType() {
    return widget.filterType == FilterType.must;
  }

  // 다중 선택 타입
  bool isMultiType() {
    return widget.filterType == FilterType.multi;
  }

  // 다중 선택타입에서 선택 여부
  bool isSelectedMultiType() {
    return (widget.isSelected && widget.filterType == FilterType.multi);
  }
}