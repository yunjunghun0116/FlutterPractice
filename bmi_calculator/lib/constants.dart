import 'package:flutter/material.dart';

//constants라는 파일에 모아놓으면 좋은이유는 여기서 원하는값을 바로 바꾸기만 하면되며
//이름을 수정할때도 refactor기능 사용하면 쉽게 바꿀수있음

//enum은 이해를 편하게하기위해서 생성한것이고, 문서화작업을 좀더 편하게해서 나중에 봐도 1,2 같은게아닌
//남성,여성 등으로 설정할수있어 헷갈릴일이없도록 하는것.
enum genderType {
  male,
  female,
}

const contentLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const numberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const unitTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFF8D8E98),
);


//이런 식으로 미리 정해논후에(여러군데 쓰일경우 사용하는게 유용할듯.) 호출해서 사용하는게 좋다.
const noClickedCardColor = Color(0xFF1D1E33);
const ClickedCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;
const sliderActiveColor = Color(0xFFEB1555);
const sliderInactiveColor = Color(0xFF8D8E98);

