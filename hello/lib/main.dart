import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          //화면만을 이용 디바이스 최상단부분과 연관X이게 만듬
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: double.infinity,
                width: 100.0,
                color: Colors.red,
                child: Text("First"),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                //EdgeInsets.all -> 모두, symmetric: vertical:상하, horizontal:좌우, fromLTRB:내가원하는곳만
                color: Colors.yellow,
                child: Text("Second"),
              ),
              Container(
                height: double.infinity,
                width: 100.0,
                color: Colors.lightBlue,
                child: Text("Third"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
