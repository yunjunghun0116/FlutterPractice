import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'GetX State Management',
            style: TextStyle(fontSize: 20.0),
          ),
          GetBuilder<CountControllerGetX>(
            id: 'first',
            builder: (controller) {
              return Text(
                'first:${controller.count}',
                style: TextStyle(fontSize: 30.0),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerGetX>().increase('first');
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerGetX>().decrease('first');
            },
            child: Text(
              '-',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          GetBuilder<CountControllerGetX>(
            id: 'second',
            builder: (controller) {
              return Text(
                'second:${controller.count}',
                style: TextStyle(fontSize: 30.0),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerGetX>().increase('second');
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerGetX>().decrease('second');
            },
            child: Text(
              '-',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
