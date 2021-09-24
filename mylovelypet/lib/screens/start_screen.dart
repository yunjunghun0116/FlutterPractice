import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class StartScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(
            child: Text('네트워크 확인후 다시접속해주세요...'),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return HomeScreen();
        }
        return Center(
          child: Text('연결중입니다...'),
        );
      },
    );
  }
}
