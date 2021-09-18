import 'package:cloud_firestore/cloud_firestore.dart';

class Rider{
  String riderName;
  String riderPhoneNumber;
  int riderAge;
  Rider({required this.riderName,required this.riderPhoneNumber,required this.riderAge});

  void submitRider(){
    Map<String,dynamic> body = {
      'name':riderName,
      'riderPhoneNumber':riderPhoneNumber,
      'age':riderAge,
    };
    FirebaseFirestore.instance.collection('Rider').add(body);
  }
}