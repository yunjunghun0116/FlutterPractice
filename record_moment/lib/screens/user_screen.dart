import 'package:flutter/material.dart';
import 'package:record_moment/screens/login_screen.dart';
import 'package:record_moment/screens/register_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                })),
            child: Text('로그인'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RegisterScreen();
            })),
            child: Text('회원가입'),
          ),
        ],
      ),
    );
  }
}
