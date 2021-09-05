import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'login_screen.dart';
import '../components/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            User? user = snapshot.data as User?;
            if (!snapshot.hasData) {
              return LoginScreen();
            } else {
              return FirstScreen(user!);
            }
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
