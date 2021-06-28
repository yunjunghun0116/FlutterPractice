import 'package:flutter/material.dart';
//option + enter => Wrap widget
//image 1.NetworkImage 2.AssetImage( -> pubspec.yaml에서 수정)
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('I Am Rich'),),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Image(
            image:AssetImage('images/diamond1.jpeg')
          ),
        ),
      ),
    ),
  );
}
