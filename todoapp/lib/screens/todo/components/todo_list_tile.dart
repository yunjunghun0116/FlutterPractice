import 'package:flutter/material.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/models/todo.dart';

import '../../../utils/local_utils.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;
  const TodoListTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () => TodoController.to.todoStateUpdate(id: todo.id),
        child: todo.state == 0
            ? const Icon(Icons.check_box_outline_blank)
            : Icon(
                Icons.check_box,
                color: todo.state == 2 ? Colors.blueAccent : null,
              ),
      ),
      title: Text(
        todo.todo,
        style: TextStyle(
          decoration:
          todo.state == 2 ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        getDateTime(
          todo.dateTime,
        ),
      ),
      trailing: todo.state == 1
          ? GestureDetector(
              onTap: () =>  TodoController.to.todoStateUpdate(id: todo.id),
              child: const Text(
                '완료',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            )
          : null,
    );
  }
}
