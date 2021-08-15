import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

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
            Text('${Get.arguments['name']}의 나이는 ${Get.arguments['age']}입니다.'),
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
