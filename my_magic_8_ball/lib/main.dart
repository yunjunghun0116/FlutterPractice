import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Magic 8 Balls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNum = 1;

  void setRandom() {
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Ask Me Anything',
          style: TextStyle(
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: TextButton(
          onPressed: () {
            setRandom();
          },
          child: Image.asset(
            'images/ball$ballNum.png',
          ),
        ),
      ),
    );
  }
}
