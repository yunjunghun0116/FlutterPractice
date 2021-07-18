import 'dart:io';

void main() {
  performTasks();
}

void performTasks()  async{
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}
//future는 기다려야할 함수가 내부에 존재한다는 의미
//Future는 String,int등과는 다르게 미래에 어떤 값을 return 받는다는것을 의미
Future task2() async  {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds,(){
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String taskData) {
  String result = 'task 3 data';
  print('Task 3 complete with $taskData');
}