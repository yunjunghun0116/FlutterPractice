import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huntalk/controllers/fcm_controller.dart';
import 'package:huntalk/controllers/local_controller.dart';
import 'package:huntalk/models/chatRoom.dart';
import 'package:huntalk/models/user.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _fireStorage = FirebaseStorage.instance;
  User? user;
  final Uuid _uuid = const Uuid();

  Future<bool> getUser(String id)async{
    try{
      DocumentSnapshot data = await _firestore.collection('user').doc(id).get();
      user = User.fromJson({
        'id':data.id,
        ...data.data() as Map<String,dynamic>
      });
      update();
      return true;
    }catch(e){
      return false;
    }

  }

  Future<bool> registerUser(
      {required String name,
      required String phone,
      required String email,
      required String password,}) async {
    try {
      String _id = _uuid.v4();
      await _firestore.collection('user').doc(_id).set({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'chatRoomList': [],
        'imageUrl':''
      });
      LocalController.to.setId(_id);
      user = User(
        id: _id,
        name: name,
        imageUrl: '',
        email: email,
        password: password,
        phone: phone,
        notificationToken: '',
        chatRoomList: [],
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginUser(
      {required String email, required String password}) async {
    try {
      QuerySnapshot _loginData = await _firestore
          .collection('user')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();
      if (_loginData.docs.isNotEmpty) {
        user = User.fromJson({
          'id': _loginData.docs.first.id,
          ..._loginData.docs.first.data() as Map<String, dynamic>
        });
        LocalController.to.setId(_loginData.docs.first.id);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> uploadProfileImage(File file) async {
    try {
      String destination = 'images/${user!.id}';
      final ref = _fireStorage.ref(destination);
      TaskSnapshot uploadedFile = await ref.putFile(file);
      if (user!.imageUrl.isEmpty) {
        String downloadUrl = await uploadedFile.ref.getDownloadURL();
        await _firestore
            .collection('user')
            .doc(user!.id)
            .update({'imageUrl': downloadUrl});
      }
      return true;
    } catch (e) {
      print('uploadProfileImageErrorMsg: $e');
      return false;
    }
  }

  Future<void> refreshUser() async {
    DocumentSnapshot _userData =
        await _firestore.collection('user').doc(user!.id).get();
    user = User.fromJson(
        {'id': _userData.id, ..._userData.data() as Map<String, dynamic>});
    update();
  }

  Future<bool> updateUser(Map<String,dynamic> body)async{
    try{
      await _firestore
          .collection('user')
          .doc(user!.id).update(body);
      return true;
    }catch(e){
      return false;
    }
  }

  Future<User> getUserWithId(String id)async{
    DocumentSnapshot userData = await _firestore
        .collection('user')
        .doc(id).get();
    return User.fromJson({
      'id':userData.id,
      ...userData.data() as Map<String,dynamic>
    });
  }
}
