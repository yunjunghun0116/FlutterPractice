import 'package:app/components/view/navigation_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InuseProductPage extends StatefulWidget {
  const InuseProductPage({Key? key}) : super(key: key);

  @override
  _InuseProductPageState createState() => _InuseProductPageState();
}

class _InuseProductPageState extends State<InuseProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: NavigationBarView(
          title: '사용중 제품',
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){},
            child: Icon(Icons.arrow_drop_down),),
            Container(
              width: 300,
              height: 88,
              child: userPayment(),
            )
          ],
        ),
      ),
    ));
  }

  userPayment() {
    return Column(
      children: [
        Row(),
        Row(),
        Row(),
      ],
    );
  }
}
