import 'package:flutter/material.dart';
import 'package:my_daily_todo_app/screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TaskScreen(),
      },
    );
  }
}
