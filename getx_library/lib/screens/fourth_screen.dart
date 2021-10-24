import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FourthScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Get.parameters['id']}'),
            Text('${Get.parameters['key']}'),
            Text('${Get.parameters['name']}'),
          ],
        ),
      ),
    );
  }
}
