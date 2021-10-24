import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/components/custom_buttons.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ThirdScreen')),
      body: Column(
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '이름 :${Get.arguments['이름']}\n',
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: '나이 : ${Get.arguments['나이']}',
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(title: '뒤로가기', onClicked: (){
            Get.back();
          }),
        ],
      ),
    );
  }
}
