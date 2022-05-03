import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('쇼핑'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/memberships/img_chair_bg.png',
              alignment: Alignment.topCenter,
              width: 200,
              height: 73,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/memberships/img_chair_bg.png',
              alignment: Alignment.center,
              width: 200,
              height: 73,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/memberships/img_chair_bg.png',
              alignment: Alignment.bottomCenter,
              width: 200,
              height: 73,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
