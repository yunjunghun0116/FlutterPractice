import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentsScreen extends StatelessWidget {
  const ArgumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    print(Get.arguments);
    var args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            // Get.back();
            Get.back(result: '부산');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
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
