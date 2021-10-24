import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/components/custom_buttons.dart';

import 'getx_controller.dart';

class ReactiveScreen extends StatefulWidget {
  const ReactiveScreen({Key? key}) : super(key: key);

  @override
  _ReactiveScreenState createState() => _ReactiveScreenState();
}

class _ReactiveScreenState extends State<ReactiveScreen> {
  final controller = Get.put(ReactiveController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Reactive'),
          const Divider(),
          GetX<ReactiveController>(
            builder: (_) {
              return Text('Count1 : ${controller.count1.value}');
            },
          ),
          Obx(() {
            return Text('Count2 : ${controller.count2.value}');
          }),
          Obx(() {
            return Text('Sum : ${controller.sum}');
          }),
          CustomButton(
            title: 'Count1 Increment',
            onClicked: () {
              controller.count1.value++;
            },
          ),
          CustomButton(
            title: 'Count2 Increment',
            onClicked: () {
              controller.count2.value++;
            },
          ),
          const Divider(),
          Obx(() {
            return Text(
                'User \nid: ${controller.user.value.id}\nname:${controller.user.value.name}');
          }),
          CustomButton(
            title: 'User Update',
            onClicked: () {
              controller.change(id: 3, name: 'TaeHun');
            },
          ),
          const Divider(),
          Obx(() {
            return Text(
                'List : ${controller.testList}');
          }),
          CustomButton(
            title: 'List Update',
            onClicked: () {
              controller.testList.add(controller.testList.last+1);
            },
          ),
        ],
      ),
    );
  }
}
