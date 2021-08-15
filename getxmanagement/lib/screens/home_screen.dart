import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/first_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX라우트관리홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //to vs off/offAll의 차이는 stack에 넣기만하느냐 넣은상태로 빼지못하게하느냐차이이다.
                Get.toNamed('/first');
              },
              child: Text('GetX 라우트이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/next',arguments: {'name':'YunJunghun','age':'23'});
              },
              child: Text('Argument 전달'),
            ),
          ],
        ),
      ),
    );
  }
}
