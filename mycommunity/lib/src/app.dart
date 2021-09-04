import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'routes_manage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Firebase Load Fail'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return RoutesManage();
          }
          return CircularProgressIndicator();
        });
  }
}
