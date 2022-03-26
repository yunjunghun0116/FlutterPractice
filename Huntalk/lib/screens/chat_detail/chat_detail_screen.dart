import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:huntalk/models/chat.dart';
import 'package:huntalk/models/chatRoom.dart';
import 'package:huntalk/utils/chat_utils.dart';
import 'package:huntalk/utils/stream_utils.dart';

class ChatDetailScreen extends StatefulWidget {
  final String id;
  const ChatDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅룸'),
      ),
      body: StreamBuilder(
        stream: StreamUtils().getChatStream(widget.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot chatData = snapshot.data;
            print(chatData.docs);
            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: chatData.docs.map((e){
                      Chat chat = Chat.fromJson({
                        'id':e.id,
                        ...e.data() as Map<String,dynamic>
                      });
                      return Text(chat.message);
                    }).toList(),
                  ),
                ),
                SafeArea(
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ChatUtils().sendMessageInChatRoom(chatRoomId: widget.id, message: _messageController.text, messageType: 'text',);
                          },
                          child: const Text('전송하기'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
