import 'dart:io';

//1. initState -> build
//2. deactivate (되돌아가기 - Navigation.pop(context) 실행시)

/*
myNum ?? 30.0 -> myNum이 있으면 myNum을 사용하고 ,Null값을 가질경우 30.0을 사용한다.
주로 변수선언해준후에
try{
}catch(e){
}문을 사용해서 exception을 다룬다.
또한 Null일경우를 대비해서 ??연산자를 사용해준다 -> Dart언어에서 사용 -> var ?? defaultValue
 */


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