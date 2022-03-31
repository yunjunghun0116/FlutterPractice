import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:huntalk/constants.dart';
import '../controllers/user_controller.dart';

class ChatUtils {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _fireStorage = FirebaseStorage.instance;

  Future<String?> chatWithUser({
    required String receiverId,
    required String receiverImageUrl,
    required String receiverName,
  }) async {
    //1. chat을 만든다
    //2. update를 하는데 receiver,user 둘다 업데이트해준다
    try {
      for (var chatroom in UserController.to.user!.chatRoomList) {
        if (chatroom['userList'].contains(receiverId)) {
          return chatroom['id'];
        }
      }
      String _timeStamp = DateTime.now().toString();
      DocumentReference<Map<String, dynamic>> _chatData =
          await _firestore.collection('chatroom').add({
        'userIdList': [UserController.to.user!.id, receiverId],
        'userList': [
          {
            'id': UserController.to.user!.id,
            'name': UserController.to.user!.name,
            'imageUrl': UserController.to.user!.imageUrl,
          },
          {
            'id': receiverId,
            'name': receiverName,
            'imageUrl': receiverImageUrl,
          },
        ],
        'timeStamp': _timeStamp,
        'lastMessage': '',
        'lastMessageTimeStamp': _timeStamp,
      });
      await _firestore
          .collection('user')
          .doc(UserController.to.user!.id)
          .update({
        'chatRoomList': [
          ...UserController.to.user!.chatRoomList,
          {
            'id': _chatData.id,
            'userList': [UserController.to.user!.id, receiverId],
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
    String timeStamp = DateTime.now().toString();
    if (messageType == 'text') {
      await _firestore.collection('chatroom').doc(chatRoomId).update({
        'lastMessage': message,
        'lastMessageTimeStamp': timeStamp,
      });
    }
    await _firestore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chat')
        .add({
      'senderId': UserController.to.user!.id,
      'message': message,
      'messageType': messageType,
      'timeStamp': timeStamp,
    });
  }

  Future<String?> saveImageInStorage(
      {required String chatroomId, required File image}) async {
    try {
      String destination = 'chatroom/$chatroomId';
      final ref = _fireStorage.ref(destination);
      TaskSnapshot uploadedFile = await ref.putFile(image);
      return await uploadedFile.ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<void> sendFCM({required String token}) async {
    if (token == '') return;
    http.Response data = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Authorization': 'key=$serverKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'direct_boot_ok': true,
        'registration_ids': [
          'fdIDdF_0Lk6WufOLFmiqzW:APA91bGTO9jvd9YYQDPfaa_j0Lysjh1zh460o6985JyVDLl21RVV2xSXBEDNAkU49jCVh71PV3jZ4qTREXfKMwJgK5v-0GkOgvFc6mrMvanX3dkVWkktxbnyKRmp5X1UbxuklpphuuJJ',
          'dlo-KZsgT9KViBl86IIkCq:APA91bESIuShWRzpNmxw8YZ0kyFvSHU8RxpO1pzvbAJNaIZvATq3oxQm14AZotafOaF8_LNQsmjYd-5hynv-pglsM7yCXBbeKAGHT8B-KWh1Qrz1pGgN-Z4RXS1jpeT4oPTJfMdcci-o'
        ],
        'notification': {
          'body': 'FCM body',
          'title': 'FCM title',
        },
        'data': {
          'body': 'FCM bodyx',
          'title': 'FCM titlex',
        },
      }),
    );
  }
}
