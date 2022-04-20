import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/screens/user/user_screen.dart';

import '../constructor/constructor_screen.dart';

class HomeScreen extends StatelessWidget {

  final String screenRoutes = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'toTest',
              ),
            ),
            //constructorScreen
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (builder) =>
                //           const ConstructorScreen(name: '정훈', age: 24)),
                // );
                Get.off(() => const ConstructorScreen(name: '정훈', age: 24));
              },
              child: const Text(
                'toConstructorScreen',
              ),
            ),
            //argumentsScreen
            TextButton(
              onPressed: () async {
                // Navigator.pushNamed(
                //   context,
                //   '/arguments',
                //   arguments: {'name': '정훈', 'age': 24},
                // );
                var val = await Get.toNamed(
                  '/arguments',
                  arguments: {'name': '정훈', 'age': 24},
                );
                // 회원가입 개인정보 배달/당근마켓 (지역선택)
                print(val);
              },
              child: const Text(
                'toNamedArgumentsScreen',
              ),
            ),
            //parametersScreen
            TextButton(
              onPressed: () {
                Get.toNamed('/parameters/abcd1234?name=정훈&age=24');
              },
              child: const Text(
                'toNamedParametersScreen',
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return Dialog(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 100,
                      child: const Text('Dialog'),
                    ),
                  );
                });
                // Get.dialog(
                //   Dialog(
                //     child: Container(
                //       alignment: Alignment.center,
                //       width: double.infinity,
                //       height: 100,
                //       child: const Text('Dialog'),
                //     ),
                //   ),
                // );
              },
              child: const Text('showDialog'),
            ),
            TextButton(
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: const Text('Content'),
                //   ),
                // );
                Get.snackbar('Title', 'Content');
              },
              child: const Text(
                'show SnackBar',
              ),
            ),
            TextButton(
              onPressed: () {
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return Container(
                //       height: 300,
                //       color: Colors.blueGrey,
                //     );
                //   },
                // );
                Get.bottomSheet(
                  Container(
                    height: 300,
                    color: Colors.blueGrey,
                  ),
                );
              },
              child: const Text(
                'BottomSheet',
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => UserScreen());
              },
              child: const Text(
                'toUserScreen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
