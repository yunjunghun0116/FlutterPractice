import 'package:get/get.dart';

class CountControllerGetX extends GetxController{
  static CountControllerGetX get to => Get.find();
  //이렇게 할경우
  //Get.find<CountControllerGetX>().increase(); 이러한방식이아니라
  //CountControllerGetX.to.increase();처럼 해줄수있다.
  //원하는 컨트롤러에 대한 접근이 조금 더 간편해졌다는것을 볼 수 있다.
  //싱글턴방식의경우 대부분 하나의 컨트롤러만 이용하기때문에 그경우 이렇게접근하는것이 더 편할수 있다

  RxInt count = 0.obs;

  void increase() {
    count++;
    // update();
    //obs타입의 경우 스스로 update를 진행해주기때문에 update()를 넣어줄필요가없지만
    //일반적인 타입 ex)int,double등 의경우는 따로 update()를 진행해주어야한다.
  }

  void decrease(String id) {
    count--;
    update([id]);
  }

}