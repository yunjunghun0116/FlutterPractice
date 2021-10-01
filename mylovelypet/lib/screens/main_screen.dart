import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetmoments/components/constants.dart';
import '../controller/pet_controller.dart';
import '../components/feed_time_bottom_sheet.dart';
import '../components/moment_upload_bottom_sheet.dart';
import '../components/pet_image_component.dart';
import '../components/feed_time_component.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final petNameController = TextEditingController();
  PetController controller = Get.put(PetController());

  String _petName = 'Pet';

  @override
  initState() {
    super.initState();
    _petName = controller.petName;
  }

  Widget _feedTimeArea() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(controller.petId)
          .doc('feedTime')
          .collection('time')
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
          List<FeedTimeComponent> timeList = [];
          for (var time in times) {
            String id = time.id;
            String prev = time['previousTime'];
            String future = time['futureTime'];
            bool isFinished = time['isFinished'];
            FeedTimeComponent feedTimeData = FeedTimeComponent(
                controller.petId, id, prev, future, isFinished);
            timeList.add(feedTimeData);
          }
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.withOpacity(0.7),
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

  Widget _petImageArea() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(controller.petId)
            .doc('moment')
            .collection('moment')
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
            List<PetImageComponent> momentList = [];
            for (var moment in moments) {
              String id = moment.id;
              String imageUrl = moment['imageUrl'].length == 0
                  ? noImageUrl
                  : moment['imageUrl'][0];
              String comment = moment['comment'];
              String date = moment['date'];
              PetImageComponent momentData =
                  PetImageComponent(id, imageUrl, comment, date);
              momentList.add(momentData);
            }
            return Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.7),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: momentList,
                ),
              ),
            );
          }
        });
  }

  Widget _addArea() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black45),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              Get.bottomSheet(FeedTimeBottomSheet());
            },
            child: Container(
              width: 60,
              child: Text('식사시간'),
              alignment: Alignment.center,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black45),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              Get.bottomSheet(MomentUploadBottomSheet());
            },
            child: Container(
              width: 60,
              child: Text('추억'),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(String petName) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'My Lovely ${petName}',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _petNameArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pet Name',
        ),
        TextField(
          controller: petNameController,
        ),
      ],
    );
  }

  //displayName이 설정되지 않은경우
  Widget _setPetNameArea() {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _petNameArea(),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.changePetName(petNameController.text);
                  _petName = petNameController.text;
                });
              },
              child: Text(
                '이름 설정',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _isDefined() {
    if (_petName == '') {
      return _setPetNameArea();
    } else {
      return Scaffold(
        appBar: _appBar(_petName),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: _feedTimeArea(),
              ),
              Expanded(
                flex: 5,
                child: _petImageArea(),
              ),
              Expanded(
                flex: 1,
                child: _addArea(),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isDefined();
  }
}
