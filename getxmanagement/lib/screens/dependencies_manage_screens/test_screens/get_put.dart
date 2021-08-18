import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/dependencies_controller/dependencies_controller.dart';

class GetPutScreen extends StatelessWidget {
  const GetPutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Put'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Get.find<DependenciesController>().increase();
          print(Get.find<DependenciesController>().hashCode);
        },
        child: Text('GetLazyPutTestButton'),
      ),
    );
  }
}
