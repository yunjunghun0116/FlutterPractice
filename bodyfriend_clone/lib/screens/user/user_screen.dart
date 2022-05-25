import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              UserController.to.signOut();
            },
            child: Text(
              '로그아웃',
            ),
          )
        ],
      ),
    );
  }
}
