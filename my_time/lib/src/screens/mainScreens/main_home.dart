import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //데이터를 가져온 후에 만약 허가된 상품이면 데이터를 가져와서 카드형식으로 출력한다
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('홈'),
        ],
      ),
    );
  }
}
