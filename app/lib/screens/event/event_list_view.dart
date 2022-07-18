

import 'package:app/components/view/available_place_view.dart';
import 'package:app/constants/constants.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/models/event/event_list_model.dart';
import 'package:app/components/view/available_grade_view.dart';
import 'package:app/screens/event/event_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EventListView extends StatelessWidget {

  final EdgeInsets? padding;
  final EventContent eventContent;

  const EventListView({
    Key? key,
    this.padding,
    required this.eventContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('eventContent.id : ${eventContent.id}');
        Get.to(() {
          return EventDetailScreen();
        },
        arguments: eventContent.id);
      },
      child: Column(
      children: [
          Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: padding ?? const EdgeInsets.all(0),
                  child: Image(image: NetworkImage(eventContent.imageBanner ?? ""),
                  )
              ),
              Container(
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      color: kBlackColor,
                      child: Text(eventContent.getRegionType(),
                          style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 12))
                  )
              ),
              Visibility(
                  visible: eventContent.eventStatus == 'END',
                  child: Positioned.fill(
                      child: Container(
                          color: const Color.fromRGBO(0, 0, 0, 0.6),
                          alignment: Alignment.center,
                          child: const Text('종료',
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                      )
                  ))
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  AvailableGradeView(
                      eventContent: eventContent
                  ),
                  AvailablePlaceView(
                      eventContent: eventContent
                  )
                ],
              )
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventContent.getTitle(),
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                      textAlign: TextAlign.left),
                  Text(eventContent.getDate(),
                      style: const TextStyle(fontSize: 12, color: kGreyColor),
                      textAlign: TextAlign.left),
                  Text(eventContent.getViewCount(),
                      style: const TextStyle(fontSize: 12, color: kGreyColor),
                      textAlign: TextAlign.left),
                ]),

          ),
        ],
      ),
    );
  }
}