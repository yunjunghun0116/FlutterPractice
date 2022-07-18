import 'package:app/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              UserController.to.signOut();
            },
            child: Text(
              "로그아웃",
            ),
          ),
        ],
      ),
    );
  }
}
