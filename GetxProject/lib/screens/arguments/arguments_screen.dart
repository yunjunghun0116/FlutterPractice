import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentsScreen extends StatelessWidget {
  const ArgumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    print(Get.arguments);
    var args = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(args['name']),
            Text('${args['age']} 살'),
          ],
        ),
      ),
    );
  }
}
