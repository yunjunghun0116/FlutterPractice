import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParameterScreen extends StatelessWidget {
  const ParameterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.parameters);
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)?IconButton(
          onPressed: (){
            Get.back(result: 'hello');
          },
          icon: Icon(Icons.arrow_back_ios),
        ):null,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Get.parameters['id']??''),
            Text(Get.parameters['name']??''),
            Text(Get.parameters['age']??''),
          ],
        ),
      ),
    );
  }
}
