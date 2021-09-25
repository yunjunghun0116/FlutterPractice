import 'package:cloud_firestore/cloud_firestore.dart';

class UploadFirebaseStore {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> uploadFeedTime(String petId, Map<String, dynamic> body) async{
    await _fireStore.collection(petId).doc('feedTime').collection('time').add(body);
  }
}
