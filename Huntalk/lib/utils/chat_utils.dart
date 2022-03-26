import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/user_controller.dart';

class ChatUtils {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> chatWithUser({required String receiverId}) async {
    //1. chat을 만든다
    //2. update를 하는데 receiver,user 둘다 업데이트해준다
    try {
      for (var chatroom in UserController.to.user!.chatRoomList) {
        if (chatroom['userList'].contains(receiverId)) {
          return chatroom['id'];
        }
      }
      DocumentReference<Map<String, dynamic>> _chatData =
          await _firestore.collection('chatroom').add({
        'userList': [UserController.to.user!.id, receiverId],
        'timeStamp': DateTime.now().toString(),
      });
      await _firestore
          .collection('user')
          .doc(UserController.to.user!.id)
          .update({
        'chatRoomList': [
          ...UserController.to.user!.chatRoomList,
          {
            'id': _chatData.id,
            'userList': [
              UserController.to.user!.id,
              receiverId,
            ],
          }
        ]
      });
      DocumentSnapshot<Map<String, dynamic>> _receiverData =
          await _firestore.collection('user').doc(receiverId).get();

      await _firestore.collection('user').doc(receiverId).update({
        'chatRoomList': [
          ..._receiverData.data()!['chatRoomList'],
          {
            'id': _chatData.id,
            'userList': [UserController.to.user!.id, receiverId],
          }
        ]
      });
      await UserController.to.updateUser();
      return _chatData.id;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> sendMessageInChatRoom({
    required String chatRoomId,
    required String message,
    required String messageType,
  }) async {
    await _firestore.collection('chatroom').doc(chatRoomId).collection('chat').add({
      'senderId':UserController.to.user!.id,
      'message':message,
      'messageType':messageType,
      'timeStamp':DateTime.now().toString(),
    });
  }
}
