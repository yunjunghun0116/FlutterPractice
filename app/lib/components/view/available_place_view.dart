
import 'package:app/icon.dart';
import 'package:app/models/event/event_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailablePlaceView extends StatelessWidget {

  EventContent eventContent;

  AvailablePlaceView({Key? key,
    required this.eventContent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
        gradeChild()
    );
  }

  List<Widget> gradeChild() {
    List<Widget> child = [
      Container(
            padding: const EdgeInsets.only(right: 4),
            child: const Image(image: AssetImage(tagOnline)), height: 20),
        Container(
            padding: const EdgeInsets.only(right: 4),
            child: const Image(image: AssetImage(tagPlace)), height: 20,)
    ];

    if(eventContent.progressType == 'OFFLINE') {
      child.removeAt(0);
    } else if(eventContent.progressType == 'ONLINE') {
      child.removeAt(1);
    }
    return child;
  }
}

