import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            User? user = snapshot.data as User?;
            print(user);
            if (!snapshot.hasData) {
              return LoginScreen();
            } else {
              return FirstScreen(user!);
            }
          },
        ),
      ),
    );
  }
}
