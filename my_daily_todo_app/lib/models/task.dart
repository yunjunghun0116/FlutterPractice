class Task{
  final String? taskTitle;
  bool? isDone;
  Task({this.taskTitle='',this.isDone = false});

  void toggleDone(){
    isDone = !isDone!;
  }
  String? getTaskTitle(){
    return taskTitle;
  }
  bool? getIsDone(){
    return isDone;
  }
}