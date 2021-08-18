import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_getx.dart';

//이경우에 이미 컨트롤러를 넣어준것이기때문에
//아래에서
//Get.find<CountControllerGetX>().increase(); 이방식이아닌
//controller.increase(); 해버리면 된다. -> 훨씬간편하다.
//
class BindingScreen extends GetView<CountControllerGetX> {
  const BindingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('바인딩관리'),
      ),
      body: Column(
        children: [
          //컨트롤러의 변수가 Rx타입이어야하고, .obs를 붙여주어야만
          //Obx의 기능을 통해 코드를 간단하게 줄일수 있다.
          Obx(() => Text(
                controller.count.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          ElevatedButton(
            onPressed: () {
              controller.increase();
            },
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
