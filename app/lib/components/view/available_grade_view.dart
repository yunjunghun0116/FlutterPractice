import 'package:app/models/event/event_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailableGradeView extends StatelessWidget {
  EventContent eventContent;

  AvailableGradeView({Key? key, required this.eventContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start, children: gradeChild());
  }

  List<Widget> gradeChild() {
    List<Widget> child = [];
    eventContent.gradeTypes?.forEach((element) {
      child.add(Container(
          padding: EdgeInsets.only(right: 4),
          child: Image(
              image: AssetImage(element.imageFromGradeType()), height: 20)));
    });

    return child;
  }
}
