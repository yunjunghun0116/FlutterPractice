import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_with_getx.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_with_provider.dart';
import 'package:getxmanagement/screens/state_manage_screens/state/with_getX.dart';
import 'package:getxmanagement/screens/state_manage_screens/state/with_provider.dart';
import 'package:provider/provider.dart';

class SimpleStateScreen extends StatelessWidget {
  const SimpleStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetX());
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleStateScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: MultiProvider(
                providers: [
                  ChangeNotifierProvider<CountControllerWithProvider>(
                    create: (context) => CountControllerWithProvider(),
                  ),
                ],
                child: WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
