import 'package:bodyfriend_clone/constants.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text('쇼핑'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: 135,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/memberships/img_chair_bg@3x.png'
                  ),
                )
              ),
              child: Image.asset('assets/memberships/img_chair_3@3x.png'),
            ),
          ],
        ),
      ),
    );
  }
}
