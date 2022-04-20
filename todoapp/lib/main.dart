import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder((){
        Get.put(TodoController());
      }),
      home: const MainScreen(),
    );
  }
}
