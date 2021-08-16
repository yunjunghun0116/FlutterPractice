import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NextScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${Get.parameters['name']}의 나이는 ${Get.parameters['age']}살이고 uid는 ${Get.parameters['uid']}이다'),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/next');
              },
              child: Text('WOW'),
            ),
          ],
        ),
      ),
    );
  }
}
