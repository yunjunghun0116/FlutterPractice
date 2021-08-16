import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_reactive_getx.dart';

class ReactiveStateScreen extends StatelessWidget {
  const ReactiveStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerReactive());
    return Scaffold(
      appBar: AppBar(
        title: Text('ReactiveStateScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GetX State Management',
              style: TextStyle(fontSize: 20.0),
            ),
            //Obx 대신 GetX와 builder를 사용해도 가능함
            // GetX(builder: (controller){
            //   return Text(
            //     '${Get.find<CountControllerReactive>().count.value}',
            //     style: TextStyle(fontSize: 20.0),
            //   );
            // }),처럼 사용 가능
            Obx(() {
              return Text(
                '${Get.find<CountControllerReactive>().count.value}',
                style: TextStyle(fontSize: 20.0),
              );
            }),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerReactive>().increase();
              },
              child: Text(
                'WOW',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            //값이 변화할경우에 화면을 업데이트해줌 ex)5로변경을 여러번찍을때
            //단순상태관리에서는 이미 5여도 reload해주고,
            //반응형상태관리에서는 이미 5이면 reload하지않는다
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerReactive>().putNumber(5);
              },
              child: Text(
                '5로변경',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
