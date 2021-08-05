import 'package:flutter/material.dart';
import 'package:my_daily_todo_app/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskLists extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              taskTitle: taskItem.taskTitle,
              isChecked: taskItem.isDone,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(taskItem);
              },
              longPressCallback: (){
                taskData.deleteTask(taskItem);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
