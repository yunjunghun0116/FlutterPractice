import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/user_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserScreen'),
      ),
      body: Obx(
        () {
          return Column(
            children: [
              Text(UserController.to.user.value.name),
              Text('${UserController.to.user.value.age}살'),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UserController.to.addUserAge();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
