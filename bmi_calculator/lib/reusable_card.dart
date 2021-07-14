import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //final이 있어야 오류없이 제대로 진행됨 -> 생성자의 변수 등에 주로 선언
  //final vs const -> final은 실행(런타임)시, const는 컴파일시에 설정된다. -> Datetime.now()에서 특히 쓸모있을듯.
  //컴파일 후에 바이트코드를 컴퓨터가 이해한 후 실행시킴.
  //const가 더 빨리 적용됨.
  final Color colour;
  final Widget cardChild;

  ReusableCard({@required this.colour, @required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      margin: EdgeInsets.all(15.0),
    );
  }
}
