import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/components/custom_buttons.dart';

import 'first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int returnVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton(
                //페이지 이동 : nav.push와 같은기능
                title: '페이지 이동',
                onClicked: () {
                  Get.to(() => const FirstScreen());
                },
              ),
              CustomButton(
                //전페이지로 못돌아가게 : nav.pushReplacement와 같은기능
                title: '전페이지로 돌아가지 못하게하기',
                onClicked: () {
                  Get.off(const FirstScreen());
                },
              ),
              CustomButton(
                title: '모든 페이지스택 삭제',
                onClicked: () {
                  Get.offAll(const FirstScreen());
                },
              ),
              const Divider(),
              Text('리턴값 : $returnVal'),
              CustomButton(
                title: '리턴값 확인하기',
                onClicked: () async {
                  final resp = await Get.toNamed('/second');
                  setState(() {
                    returnVal = resp as int;
                  });
                },
              ),
              const Divider(),
              CustomButton(
                title: '인자 보내기',
                onClicked: () {
                  Get.toNamed('/third', arguments: {
                    '이름': '정훈',
                    '나이': 23,
                  });
                },
              ),
              CustomButton(
                //쿼리를 통해 필요한 정보 내보내기
                title: '파라미터 보내기',
                onClicked: () {
                  Get.toNamed('/fourth/1234abc?key=116&name=JungHun');
                },
              ),
              const Divider(),
              CustomButton(
                title: '스낵바',
                onClicked: () {
                  Get.snackbar(
                    '이름',
                    '정훈',
                    duration: const Duration(milliseconds: 2000), //얼마나 보이게할것인지
                  );
                },
              ),
              CustomButton(
                title: '다이얼로그/Alert',
                onClicked: () {
                  Get.defaultDialog(
                    title: '여기는 타이틀',
                    middleText: '여기는 미들텍스트',
                    cancel: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: const [Text('취소하기')],
                      ),
                    ),
                  );
                },
              ),
              CustomButton(
                title: '바텀시트',
                onClicked: () {
                  Get.bottomSheet(Container(
                    height: 300,
                    color: Colors.green,
                  ));
                },
              ),
              const Divider(),
              CustomButton(
                title: 'GetX StateManagement Screen',
                onClicked: () {
                  Get.toNamed('/statement');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
