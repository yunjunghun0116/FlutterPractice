import 'package:get/get.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_getx.dart';

//이처럼 binding만 따로 빼내줄수있음
class BindingBuilderPut implements Bindings {
  //Bindings를 상속받았을때 overide에 어떤 컨트롤러를 넣어줄것인지, 어떤 바인딩을 사용할것인지
  //정해서 넣어주기만 하면 된다
  @override
  void dependencies() {
    // TODO: implement dependencies
    //permanent:true 에 대하여
    //default값은 false이고, 이는 이 페이지를 나가면 자연스레 initialized된 컨트롤러를 삭제해준다는
    //것과 같다. 하지만 로그인정보 등과 같이 페이지를 나가도 유지되어야 하는것들을 다루는 컨트롤러에 대해서는
    //permanent:true를 진행함으로써 유지될수있도록 해주는것이다.
    Get.put(CountControllerGetX(),permanent: true);
  }
}
