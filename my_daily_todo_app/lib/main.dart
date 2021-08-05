import 'package:flutter/material.dart';
import 'package:my_daily_todo_app/models/task_data.dart';
import 'package:my_daily_todo_app/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskData()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => TaskScreen(),
        },
      ),
    );
  }
}
