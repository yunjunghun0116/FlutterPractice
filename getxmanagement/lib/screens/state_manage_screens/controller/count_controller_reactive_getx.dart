import 'package:get/get.dart';

//반응형 상태관리
class CountControllerReactive{
  RxInt count = 0.obs;
  void increase(){
    count++;
  }
  void putNumber(int value){
    //count = value형식이 아닌 obs형태에서는 count라는 값에 value를 넣어준다는 개념
    count(value);
  }
}