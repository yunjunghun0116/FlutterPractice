import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  User? user;
  String userName = '';
  String userImageURL =
      'https://upload.wikimedia.org/wikipedia/commons/e/e0/Userimage.png';

  @override
  initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user!.displayName != null) {
      userName = user!.displayName!;
    }
    if (user!.photoURL != null) {
      userImageURL = user!.photoURL!;
    }
    super.initState();
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: Text('gogo'),
      title: Text('title'),
      actions: [
        Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userImageURL),
                ),
              ),
            ),
            Text(userName),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: FirebaseAuth.instance.signOut,
              icon: Icon(Icons.logout),
              iconSize: 32.0,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
