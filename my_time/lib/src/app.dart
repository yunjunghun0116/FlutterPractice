import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text('Firebase Load Fail'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          }
          return CircularProgressIndicator();
        });
  }
}
