import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetmoments/controller/pet_controller.dart';
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
  PetController? controller = Get.put(PetController());

  String _petName = '';

  @override
  initState() {
    super.initState();
    _petName = controller!.petName;
  }

  Widget _feedTimeArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(100, (index) {
            //TODO 여기서 controller로부터 model을 가져와 모델의 각각의 데이터를 넘겨주는방식, 여기서는 피드타임모델이 필요
            return FeedTimeComponent(
                index, '$index일 1시 2분', '$index일 9시 2분', false);
          }),
        ),
      ),
    );
  }

  Widget _petImageArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(30, (index) {
            //TODO 여기서 controller로부터 model을 가져와 모델의 각각의 데이터를 넘겨주는방식
            return GestureDetector(
              onTap: () {
                Get.toNamed('/detail/$index', arguments: {
                  'imageUrl': 'assets/images/duri.png',
                  'comment': '여기는 추억에 담긴 내용',
                  'date': '여기는 추억이 담긴 날짜',
                });
              },
              child: PetImageComponent(
                'assets/images/duri.png',
                '여기는 추억에 담긴 내용여기는 추억에 담긴 내용여기는 추억에 담긴 내용여기는 추억에 담긴 내용',
                '2021 9/23 19:21',
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _addArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
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
  Widget _setPetNameArea(){
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
                  controller!.changePetName(petNameController.text);
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
