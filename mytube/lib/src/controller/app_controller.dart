import 'package:get/get.dart';
import 'package:mytube/src/components/app_bottom_sheet.dart';

enum ScreenName { Home, Explore, Add, Subscribe, Library }

//GetxController를 사용하고 permanent:true를 통해 영속성을 부여해줄수있고
//루트단에서 사용할 컨트롤러는 영속성을 가지고있어야하고, 그 기능을 갖춘것이 GetxService이기때문에 Service를사용한다.
class AppController extends GetxService {

  //깍쇠를 통한 호출이 필요없도록 하는기능
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int newIndex) {
    //Rx타입의경우 =을 통해 value를 넣는것이아닌, ()를 통해 넣어준다.
    if (ScreenName.values[newIndex] == ScreenName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(newIndex);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(AppBottomSheet());
  }
}
