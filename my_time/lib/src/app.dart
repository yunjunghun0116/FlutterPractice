import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_time/src/screens/error_screen.dart';
import 'screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen(message: snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeScreen();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
