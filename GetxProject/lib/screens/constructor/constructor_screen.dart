import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructorScreen extends StatelessWidget {
  final String name;
  final int age;
  const ConstructorScreen({
    Key? key,
    required this.name,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(name);
    print(age);
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
            Text(name),
            Text('$age 살'),
          ],
        ),
      ),
    );
  }
}
