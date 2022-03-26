import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/user_controller.dart';
import 'package:huntalk/models/user.dart';
import 'package:huntalk/utils/chat_utils.dart';
import 'package:huntalk/utils/stream_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StreamUtils().getUserStream(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot data = snapshot.data;
          return Column(
              children: data.docs.map((DocumentSnapshot e) {
            User user = User.fromJson(
                {'id': e.id, ...e.data() as Map<String, dynamic>});
            return Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          user.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name),
                      Text(user.phone),
                    ],
                  ),
                  const Spacer(),
                  user.id != UserController.to.user!.id
                      ? GestureDetector(
                          onTap: () async {
                            String? chatId = await ChatUtils().chatWithUser(receiverId: user.id);
                            print(chatId);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              '채팅하기',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          }).toList());
        }
        return Container();
      },
    );
  }
}
