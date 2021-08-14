import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final User? user;

  MainScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('${user!.displayName} 님 환영합니다.'),
          TextButton(
            onPressed: FirebaseAuth.instance.signOut,
            child: Text('로그아웃하기'),
          ),
        ],
      ),
    );
  }
}
