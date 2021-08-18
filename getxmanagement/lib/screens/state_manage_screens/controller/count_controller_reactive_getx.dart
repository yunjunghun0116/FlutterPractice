import 'package:get/get.dart';

enum Num {
  FIRST,SECOND
}
class User{
  String name;
  User(this.name);
}

//반응형 상태관리
class CountControllerReactive extends GetxController{
  RxInt count = 0.obs;
  RxDouble doubleValue = 0.0.obs;
  RxString stringValue = ''.obs;
  Rx<Num> nums = Num.FIRST.obs;
  Rx<User> userValue = User('Junghun').obs;
  void increase(){
    count++;
    // nums(Num.SECOND);
    // userValue.update((_user) {
    //   _user!.name = 'hi';
    // });
  }
  void putNumber(int value){
    //count = value형식이 아닌 obs형태에서는 count라는 값에 value를 넣어준다는 개념
    count(value);
  }
  //라이프사이클
  @override
  void onInit() {
    // TODO: implement onInit
    //count가 바뀔때마다 호출
    ever(count, (_)=>print('ever가 호출되었습니다.'));
    once(count,(_)=>print('once가 호출되었습니다.'));
    debounce(count, (_)=>print('debounce가 호출되었습니다.'),time: Duration(milliseconds: 1000));
    interval(count, (_)=>print('interval가 호출되었습니다.'),time: Duration(milliseconds: 1000));
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}