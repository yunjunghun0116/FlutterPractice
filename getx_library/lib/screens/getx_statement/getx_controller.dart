import 'package:get/get.dart';
//update()를 이용한 방식 vs obs를 이용한 방식 -> Worker기능의 유무
//일반적으로 Update()를 사용하는 방식이 메모리소요를 줄일 수 있다
//하지만 Worker와 같은 기능을 사용할때는 obs를 통해 리액티브한 효과를 줄 수 있다


//Worker를 사용하지않을 경우에 아래처럼 필요할때만 update()를 해주는 방식이 메모리를 아낄 수 있다
class StateController extends GetxController {
  int count1 = 0;
  int count2 = 0;
  get sum => count1 + count2;
  increment1() {
    count1++;
    update();
  }
  increment2() {
    count2++;
    update();
  }
}

class User {
  int id;
  String name;
  User({required this.id, required this.name});
}

class ReactiveController extends GetxController {
  // 일반적으로 Rx타입 - observe되지 않는 객체에 대해서는 value를 통해 값에 접근해야한다.
  // 하지만 RxList타입과 같은것은 value로 접근하지 않아도 된다. -> 단일객체이냐 여러개가 들어있는객체이냐 차이
  RxInt count1 = 0.obs;
  RxInt count2 = 0.obs;
  Rx<User> user = User(id: 1, name: 'JungHun').obs;
  RxList testList = [1, 2, 3, 4, 5].obs;

  get sum => count1.value + count2.value;

  change({
    required int id,
    required String name,
  }) {
    user.update((val) {
      val!.id = id;
      val.name = name;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Worker함수( 관찰할 객체 , 변화가있을때 실행할 함수)
    ever(count1, (callback) {
      print('ever : 값이 변화할때마다 실행');
    });
    once(count1, (callback) {
      print('once : 값이 최초로 변화했을때만 실행');
    });
    debounce( // 일반적으로 키보드로 타이핑칠때 연관 검색어 보여주는 경우 키보드타이핑끝난후에 서버에서 연관 검색어를 가져와 보여줄때 소요
      count1,
      (callback) {
        print('debounce : 연속적으로 값이 변화하고있을때 마지막으로 변한 후 0.5초뒤에 실행');
      },
      time: const Duration(milliseconds: 500),
    );
    interval(
      count1,
      (callback) {
        print('Interval : 연속적으로 값이 변화할때 변화가 있을때마다 0.5초간 인터벌이 지나면 실행(단, interval 실행중일때는 추가로 실행 X)');
      },
      time: const Duration(milliseconds: 500),
    );
  }
}
