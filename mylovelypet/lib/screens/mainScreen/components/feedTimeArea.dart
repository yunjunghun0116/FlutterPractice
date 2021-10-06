import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../../../components/feed_time_component.dart';

class FeedTimeArea extends StatelessWidget {
  final String petId;
  FeedTimeArea(this.petId);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(petId)
          .doc('feedTime')
          .collection('time')
          .orderBy('previousTime', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        } else {
          final times = snapshot.data!.docs;
          List<Widget> timeList = [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: mainTitleText('밥줘야하는시간'),
                  ),
                  Expanded(
                    flex: 1,
                    child: mainTitleText('체크'),
                  ),
                ],
              ),
            ),
          ];
          for (var time in times) {
            String id = time.id;
            String prev = time['previousTime'];
            String future = time['futureTime'];
            bool isFinished = time['isFinished'];
            FeedTimeComponent feedTimeData =
                FeedTimeComponent(petId, id, prev, future, isFinished);
            timeList.add(feedTimeData);
          }
          return Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.deepPurpleAccent.withOpacity(0.7),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: timeList,
              ),
            ),
          );
        }
      },
    );
  }
}
