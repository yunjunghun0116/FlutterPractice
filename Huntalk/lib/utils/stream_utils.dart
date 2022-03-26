import 'package:cloud_firestore/cloud_firestore.dart';

class StreamUtils{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserStream() {
    return _firestore
        .collection('user').snapshots();
  }
}