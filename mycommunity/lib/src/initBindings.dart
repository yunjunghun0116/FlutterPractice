import 'package:get/instance_manager.dart';
import 'controller/route_controller.dart';


class InitBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RouteController());
  }
}