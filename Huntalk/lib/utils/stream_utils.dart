import 'package:cloud_firestore/cloud_firestore.dart';

class StreamUtils{
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserStream() {
    return _firestore
        .collection('user').snapshots();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatRoomStream(String userId) {
    return _firestore
        .collection('chatroom').where('userIdList',arrayContains: userId).snapshots();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatStream(String chatRoomId) {
    return _firestore
        .collection('chatroom').doc(chatRoomId).collection('chat').orderBy('timeStamp').snapshots();
  }
}