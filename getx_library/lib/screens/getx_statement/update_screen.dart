import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/components/custom_buttons.dart';
import 'package:getx_library/screens/getx_statement/getx_controller.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Update test app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('On Update'),
          GetBuilder<StateController>(
            init: StateController(),
            builder: (controller) {
              return Text('Count1 : ${controller.count1}');
            },
          ),
          GetBuilder<StateController>(
            init: StateController(),
            builder: (controller) {
              return Text('Count2 : ${controller.count2}');
            },
          ),
          GetBuilder<StateController>(
            init: StateController(),
            builder: (controller) {
              return Text('Sum : ${controller.sum}');
            },
          ),
          CustomButton(
            title: 'Count1 Increment',
            onClicked: () {
              Get.find<StateController>().increment1();
            },
          ),
          CustomButton(
            title: 'Count2 Increment',
            onClicked: () {
              Get.find<StateController>().increment2();
            },
          ),
        ],
      ),
    );
  }
}
