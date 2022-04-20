import 'package:get/get.dart';
import 'package:getx_project/models/user.dart';

class UserController extends GetxController {
  //View에서 ViewModel에 접근하는 방법
  static UserController get to => Get.find();

  Rx<User> user = User(name: 'haha', message: 'hello', age: 10).obs;

  User user2 = User(name: 'haha2', message: 'hello2', age: 15);

  void addUserAge() {
    user.update((userInputData) {
      userInputData!.addAge();
    });
  }

  void addUserAge2() {
    user2.addAge();
    update();
  }

  void searchText()async{
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(user, (callback) {
      print('ever Called');
    });
    once(user, (callback) {
      print('once Called');
    });
    //키보드로 타이핑할대 연관 검색어 보여주는 경우
    debounce(
      user,
      (callback) {
        print('debounce Called');
      },
      time: const Duration(milliseconds: 500),
    );
    interval(
      user,
      (callback) {
        print('interval Called');
      },
      time: const Duration(milliseconds: 500),
    );
  }
}
