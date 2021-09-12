import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_time/src/controller/user_controller.dart';

class MainUserScreen extends StatefulWidget {
  @override
  _MainUserScreenState createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  UserController _userController = Get.put(UserController());

  final nameController = TextEditingController();
  final photoURLController = TextEditingController();

  String userName = '';
  String phoneNumber = '저장된 연락처가 없습니다';
  String photoURL = '저장된 이미지가 없습니다';
  String uid = '';

  @override
  initState() {
    userName = _userController.displayName;
    if (_userController.phoneNumber != '') {
      phoneNumber = _userController.phoneNumber;
    }
    if (_userController.photoURL != '') {
      photoURL = _userController.photoURL;
    }
    uid = _userController.uid;
    super.initState();
  }

  Widget _userDisplayNameArea() {
    String _userNameHintText = userName != '' ? userName : '새이름을 입력하세요';
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 50.0,
      ),
      child: Column(
        children: [
          Row(
            children: [Text('유저 이름')],
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: _userNameHintText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _userPhoneNumberArea() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 50.0,
      ),
      child: Column(
        children: [
          Row(
            children: [Text('연락처')],
          ),
          Text(
            phoneNumber,
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userPhotoURLArea() {
    String _userPhotoURLHintText = '새로운 이미지 링크를 입력하세요';
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 50.0,
      ),
      child: Column(
        children: [
          Row(
            children: [Text('이미지')],
          ),
          Text(
            photoURL,
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              color: Colors.black.withOpacity(0.5),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          TextField(
            controller: photoURLController,
            decoration: InputDecoration(
              hintText: _userPhotoURLHintText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return TextButton(
      onPressed: () async {
        if (nameController.text != '') {
          await _userController.changeDisplayName(nameController.text);
        }
        if (photoURLController.text != '') {
          await _userController.changePhotoURL(photoURLController.text);
        }
        Get.offAllNamed('/main');
      },
      child: Container(
        child: Text('업데이트하기'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_userController.user);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _userDisplayNameArea(),
          _userPhoneNumberArea(),
          _userPhotoURLArea(),
          _submitButton(),
        ],
      ),
    );
  }
}
