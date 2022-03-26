import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/user_controller.dart';
import 'package:huntalk/models/chatRoom.dart';
import 'package:huntalk/screens/chat_detail/chat_detail_screen.dart';

import '../../utils/stream_utils.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StreamUtils().getChatRoomStream(UserController.to.user!.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot data = snapshot.data;
          return Column(
            children: data.docs.map((e) {
              ChatRoom chatRoom = ChatRoom.fromJson(
                  {'id': e.id, ...e.data() as Map<String, dynamic>});
              return GestureDetector(
                onTap: () {
                  Get.to(() => ChatDetailScreen(id: chatRoom.id));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(chatRoom.id),
                ),
              );
            }).toList(),
          );
        }
        return Container();
      },
    );
  }
}
