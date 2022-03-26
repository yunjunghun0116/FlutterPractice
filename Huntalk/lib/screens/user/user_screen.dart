import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/user_controller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final picker = ImagePicker();

  Future<bool> updateImage() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 540,
      maxHeight: 540,
    );
    if (pickedFile == null) return false;
    File image = File(pickedFile.path);
    bool uploadSuccess = await UserController.to.uploadProfileImage(image);
    return uploadSuccess;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(UserController.to.user!.name),
          ),
          GestureDetector(
            onTap: () async {
              await updateImage();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey.withOpacity(0.3),
              child: const Text('이미지 수정하기'),
            ),
          ),
        ],
      ),
    );
  }
}
