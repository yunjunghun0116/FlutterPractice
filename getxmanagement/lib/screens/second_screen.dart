import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('뒤로이동'),
            ),
            ElevatedButton(
              onPressed: () {
                //Get.to + Stack(history)비워주기
                Get.offAllNamed('/');
              },
              child: Text('홈으로이동'),
            ),
          ],
        ),
      ),
    );
  }
}
