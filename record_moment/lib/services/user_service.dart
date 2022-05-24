import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class UserService {
  final _firestore = FirebaseFirestore.instance;

  Future<Map<String,dynamic>> registerUser({required String email,required String password,required String name,required String birthDate})async{
    // 1. email 중복확인
    try{
      QuerySnapshot userList = await _firestore.collection('user').where('email',isEqualTo: email).get();
      if(userList.docs.isNotEmpty){
        throw "이메일 중복";
      }
      String s = email+'crypto';
      List<int> _encodedString = utf8.encode(s);
      Digest _digestString = sha256.convert(_encodedString);
      _firestore.collection('user').doc(_digestString.toString()).set({
        'email':email,
        'password':password,
        'name':name,
        'birthDate':birthDate
      });
      return {
        'success':true
      };

    }catch(e){
     return {
       'success':false,
       'msg':e.toString()
     };
    }
  }
}