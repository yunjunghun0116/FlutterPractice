import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/components/custom_buttons.dart';
import 'package:getx_library/screens/getx_statement/reactive_screen.dart';
import 'package:getx_library/screens/getx_statement/update_screen.dart';

class StatementHomeScreen extends StatelessWidget {
  const StatementHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: 'On Update',
              onClicked: () {
                Get.to(()=>const UpdateScreen());
              },
            ),
            CustomButton(
              title: 'Reactive',
              onClicked: () {
                Get.to(()=>const ReactiveScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
