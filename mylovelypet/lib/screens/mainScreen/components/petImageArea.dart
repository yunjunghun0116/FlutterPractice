import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../../../components/pet_image_component.dart';

class PetImageArea extends StatelessWidget {
  final String petId;
  PetImageArea(this.petId);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(petId)
            .doc('moment')
            .collection('moment')
            .orderBy('timeStamp')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          } else {
            final moments = snapshot.data!.docs;
            List<Widget> momentList = [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: mainTitleText('추억'),
              ),
            ];
            for (var moment in moments) {
              String id = moment.id;
              String imageUrl = moment['imageUrl'].length == 0
                  ? noImageUrl
                  : moment['imageUrl'][0];
              String comment = moment['comment'];
              String date = moment['date'];
              PetImageComponent momentData =
                  PetImageComponent(petId ,id, imageUrl, comment, date);
              momentList.add(momentData);
            }
            return Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepPurpleAccent.withOpacity(0.7),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: momentList,
                ),
              ),
            );
          }
        });
  }
}
