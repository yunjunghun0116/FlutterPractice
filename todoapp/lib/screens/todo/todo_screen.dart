import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/screens/todo/components/todo_list_tile.dart';
import 'package:todoapp/utils/local_utils.dart';

import '../../models/todo.dart';

class TodoScreen extends GetView<TodoController> {
  final int state;
  const TodoScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Todo> _todoList = controller.todoList
          .where((Todo todo) => todo.state == state)
          .toList();
      return ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoListTile(todo: _todoList[index]);
        },
      );
    });
  }
}
