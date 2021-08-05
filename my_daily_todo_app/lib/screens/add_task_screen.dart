import 'package:flutter/material.dart';
import 'package:my_daily_todo_app/models/task_data.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  final Function? addTaskCallback;
  AddTaskScreen({this.addTaskCallback});

  String? newTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTask = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context,listen: false).addTask(newTask);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
