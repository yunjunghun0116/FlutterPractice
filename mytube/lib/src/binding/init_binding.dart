import 'package:get/instance_manager.dart';
import '../repository/youtube_repository.dart';
import '../controller/app_controller.dart';

//바인딩관리는 이곳에서
//만약 여러개의 컨트롤러를 사용하고싶을땐
//메인이 되는 컨트롤러를 GetView로 처리하고, 나머지 컨트롤러는 Get.find를 통해 불러와서 처리한다.
class InitBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AppController());
    Get.put(YoutubeRepository(),permanent: true);
  }
}