import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/dependencies_controller/dependencies_controller.dart';

class GetLazyPutScreen extends StatelessWidget {
  const GetLazyPutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get LazyPut'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Get.find<DependenciesController>().increase();
          print(Get.find<DependenciesController>().count);
        },
        child: Text('GetLazyPutTestButton'),
      ),
    );
  }
}
