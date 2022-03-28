import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/user_controller.dart';
import 'package:huntalk/models/chatRoom.dart';
import 'package:huntalk/screens/chat_detail/chat_detail_screen.dart';
import 'package:huntalk/utils/local_utils.dart';

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
              Map<String, dynamic> contactPerson = chatRoom.userList.firstWhere(
                  (element) => element['id'] != UserController.to.user!.id);
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => ChatDetailScreen(
                      chatRoom: chatRoom,
                      contactPersonId: contactPerson['id'],
                      contactPersonName: contactPerson['name'],
                      contactPersonImageUrl: contactPerson['imageUrl'],
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            contactPerson['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    contactPerson['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    getDuration(
                                      chatRoom.lastMessageTimeStamp,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                chatRoom.lastMessage,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
