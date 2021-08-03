import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';

class TaskLists extends StatefulWidget {
  final List<Task>? tasks;
  TaskLists({this.tasks});
  @override
  _TaskListsState createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks?[index].getTaskTitle(),
          isChecked: widget.tasks?[index].getIsDone(),
          checkboxCallback: (bool checkboxState) {
            setState(() {
              widget.tasks?[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks?.length,
    );
  }
}
