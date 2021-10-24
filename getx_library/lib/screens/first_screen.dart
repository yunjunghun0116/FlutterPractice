import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/components/custom_buttons.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstScreen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton(
                title: '첫페이지로',
                onClicked: (){
                  Get.offAllNamed('/');
                },
              ),
              CustomButton( //뒤로가기 : nav.push와 같은기능
                title: '뒤로가기',
                onClicked: (){
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
