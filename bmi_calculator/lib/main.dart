import 'screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //darkTheme에 밑에있는 내용들만 새로 덧붙여서 내가원하는 작업하기
        //Theme은 default값을 설정하는것일뿐 이후 Theme(data:~~)에서 새로 고칠수있음
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   backgroundColor: Colors.lightGreen,
        //   foregroundColor: Colors.deepPurple,
        // ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      //home:InputPage()와 함께 할경우 route와 충돌이일어남 -> 삭제해줘야함
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
       '/result':(context) =>ResultPage(),
      },

    );
  }
}


