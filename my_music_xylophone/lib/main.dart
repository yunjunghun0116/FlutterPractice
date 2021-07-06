import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  AudioCache player = new AudioCache();

  void playSound(int i) {
    player.play('note$i.wav');
  }

  Widget xylophone({int xylophoneNum, Color xylophoneColor}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(xylophoneNum);
        },
        child: Container(
          color: xylophoneColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: Text('Xylophone'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              xylophone(xylophoneNum: 1, xylophoneColor: Colors.red),
              xylophone(xylophoneNum: 2, xylophoneColor: Colors.orange),
              xylophone(xylophoneNum: 3, xylophoneColor: Colors.yellow),
              xylophone(xylophoneNum: 4, xylophoneColor: Colors.green),
              xylophone(xylophoneNum: 5, xylophoneColor: Colors.teal),
              xylophone(xylophoneNum: 6, xylophoneColor: Colors.blue),
              xylophone(xylophoneNum: 7, xylophoneColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
