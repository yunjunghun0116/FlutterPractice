import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';
import '../components/task_lists.dart';
import '../models/task.dart';

class TaskScreen extends StatelessWidget {
  //가장 상위 수준에 위치한 위젯에 함수등을 정의해준후에
  //하위 수준에 속하는 위젯이 그 함수를 받아이용하는방식으로 정의해주어야
  //state관리를 할 수 있다. -> 상태관리는 항상 이용중 최상위 수준에 상태를 넣어주어야한다.
  //예를 들면 위의 tasks와 같은경우 task_lists,add_tasj_screen 등에서 사용하기에 가장 높은
  //task_screen에서 사용하는것이다. -> Provider가 이를 해결해줌

  @override
  Widget build(BuildContext context) {
    void addTask(String text) {
      Provider.of<TaskData>(context).tasks.add(
            Task(taskTitle: text),
          );
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(
                    addTaskCallback: addTask,
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      print('hello');
                    },
                    icon: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To do',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: TaskLists(),
            ),
          ),
        ],
      ),
    );
  }
}
