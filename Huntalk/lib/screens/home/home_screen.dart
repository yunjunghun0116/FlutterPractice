import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:huntalk/utils/stream_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: StreamUtils().getUserStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            width: double.infinity,
            height: 30,
            color: Colors.blue,
          );
        });
  }
}
