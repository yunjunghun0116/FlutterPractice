import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [
    Task(taskTitle: 'Buy milk'),
    Task(taskTitle: 'Buy eggs'),
    Task(taskTitle: 'Buy bread'),
    Task(taskTitle: 'wow'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle) {
    final task = Task(taskTitle: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    //index로 삭제시 removeAt() 사용 
    _tasks.remove(task);
    notifyListeners();
  }
}
