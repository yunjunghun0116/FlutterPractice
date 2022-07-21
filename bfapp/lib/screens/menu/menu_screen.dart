import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/controllers/local_controller.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/enum/enum.dart';
import 'package:app/screens/splash/splash_controller.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(type: NavigationType.user),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              UserController.to.signOut();
            },
            child: Text(
              "로그아웃",
            ),
          ),
          TextButton(
            onPressed: () => SplashController().checkAutoSignIn(),
            child: Text(
              '토큰값 체크',
            ),
          ),
          TextButton(
            onPressed: () async {
            },
            child: Text(
              '토큰값 체크',
            ),
          ),
        ],
      ),
    );
  }
}
