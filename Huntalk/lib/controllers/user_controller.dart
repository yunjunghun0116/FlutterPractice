import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huntalk/models/user.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _fireStorage = FirebaseStorage.instance;
  User? user;

  Future<bool> registerUser(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    try {
      String _id = '';
      await _firestore.collection('user').add({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'chatRoomList': [],
      }).then((value) {
        value.update({'imageUrl': ''});
        _id = value.id;
      });
      user = User(
          id: _id,
          name: name,
          imageUrl: '',
          email: email,
          password: password,
          phone: phone,
          chatRoomList: []);
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
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> uploadProfileImage(File file) async {
    try{
      String destination = 'images/${user!.id}';
      final ref = _fireStorage.ref(destination);
      TaskSnapshot uploadedFile = await ref.putFile(file);
      if(user!.imageUrl.isEmpty){
        String downloadUrl = await uploadedFile.ref.getDownloadURL();
        await _firestore.collection('user').doc(user!.id).update({
          'imageUrl':downloadUrl
        });
      }
      return true;
    }catch(e){
      print('uploadProfileImageErrorMsg: $e');
      return false;
    }

  }
}
