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
  String imageUrl = '';
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
    return Column(
      children: [
        Text(UserController.to.user!.name),
        GestureDetector(
          onTap: () async {
            await updateImage();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text('이미지 확인하기'),
          ),
        ),
        Text(imageUrl),
      ],
    );
  }
}
