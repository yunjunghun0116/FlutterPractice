import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          leading: Icon(Icons.favorite),
          title: Text('Random Dice'),
          backgroundColor: Colors.red[100],
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int firstDiceNumber = 1;
  int secondDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    void randomFunc(){
      setState(() {
        firstDiceNumber = Random().nextInt(6)+1;//6 : 0-5이기때문에
        secondDiceNumber = Random().nextInt(6)+1;
      });
    };
    return Center(
      child: Row(
        children: [
          Expanded(
            //Expanded는 사이즈에 맞게 요소를 배치해준다.
            //flex를 이용해서 원소간 크기 비율을 조절할수있다 2:1/3:5 등
            child: TextButton(
              onPressed: () {
                randomFunc();
              },
              child: Image.asset('images/dice$firstDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                randomFunc();
              },
              child: Image.asset('images/dice$secondDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
