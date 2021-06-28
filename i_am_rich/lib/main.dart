import 'package:flutter/material.dart';
//option + enter => Wrap widget
//image 1.NetworkImage 2.AssetImage( -> pubspec.yaml에서 수정)
//icon image : appicon.co 에서 이미지 생성후 다운로드, android,ios folder내에 해당위치에 저장
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
            image:AssetImage('images/diamond.png')
          ),
        ),
      ),
    ),
  );
}
