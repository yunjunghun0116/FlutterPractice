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
  bool isNameEditing = false;
  bool isNameChangeFinished = false;
  String petDisplayName = '';
  TextEditingController petNameController = TextEditingController();

  @override
  initState(){
    super.initState();
    petDisplayName = controller.petName;
  }

  Widget _isNameChangedArea(){
    if(isNameChangeFinished){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('동물 이름'),
            IconButton(
              onPressed: () {
                setState(() {
                  isNameEditing = false;
                });
              },
              icon: Icon(
                Icons.clear,
              ),
            ),
          ],
        ),
        TextField(
          controller: petNameController,
          decoration: InputDecoration(hintText: '10자이내 동물이름을 작성하세요~'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () async {
            setState(() {
              isNameChangeFinished = true;
            });
            controller.changePetName(petNameController.text);
            setState(() {
              isNameEditing = false;
              isNameChangeFinished = false;
              petDisplayName = petNameController.text;
              petNameController.text = '';
            });
          },
          child: Text('이름 수정하기'),
        ),
      ],
    );
  }

  Widget _isChangeNameArea() {
    if (isNameEditing) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueGrey,
        ),
        height: 200,
        child: _isNameChangedArea(),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basicColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Lovely ${petDisplayName}',
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isNameEditing = !isNameEditing;
              });
            },
            icon: Icon(
              Icons.create,
              color: Colors.black,
            ),
          ),
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
          child: Stack(
            children: [
              Column(
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
              _isChangeNameArea(),
            ],
          ),
        ),
      ),
    );
  }
}
