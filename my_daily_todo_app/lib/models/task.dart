class Task{
  final String? taskTitle;
  bool? isDone;
  Task({this.taskTitle,this.isDone = false});

  void toggleDone(){
    isDone = !isDone!;
  }
}