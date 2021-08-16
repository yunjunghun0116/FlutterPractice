import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_with_getx.dart';

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
          GetBuilder<CountControllerWithGetX>(
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
              Get.find<CountControllerWithGetX>().increase('first');
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithGetX>().decrease('first');
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          GetBuilder<CountControllerWithGetX>(
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
              Get.find<CountControllerWithGetX>().increase('second');
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithGetX>().decrease('second');
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
