import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/route_manage_screens/first_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Practice Home'),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.grey,
                child: Text(
                  '라우트관리',
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //to vs off/offAll의 차이는 stack에 넣기만하느냐 넣은상태로 빼지못하게하느냐차이이다.
                  Get.toNamed('/first');
                },
                child: Text('GetX 라우트이동'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/next',
                      arguments: {'name': 'YunJunghun', 'age': '23'});
                },
                child: Text('Argument 전달'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/user/1234?name=정훈&age=23');
                },
                child: Text('동적 URL 전달'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.amberAccent,
                child: Text(
                  '상태관리',
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/state/simple');
                },
                child: Text('단순상태관리'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/state/reactive');
                },
                child: Text('반응형상태관리'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.cyan,
                child: Text(
                  '의존성 관리',
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/dependencies_manage_screens');
                },
                child: Text('의존성 관리'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
