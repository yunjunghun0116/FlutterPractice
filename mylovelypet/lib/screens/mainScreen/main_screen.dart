import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/constants.dart';
import 'components/addArea.dart';
import 'components/feedTimeArea.dart';
import 'components/petImageArea.dart';
import '../../controller/pet_controller.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PetController controller = Get.put(PetController());

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basicColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Lovely ${controller.petName}',
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
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: FeedTimeArea(controller.petId),
              ),
              Expanded(
                flex: 5,
                child: PetImageArea(controller.petId),
              ),
              Expanded(
                flex: 1,
                child: AddArea(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
