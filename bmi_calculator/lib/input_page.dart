import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

//이런 식으로 미리 정해논후에(여러군데 쓰일경우 사용하는게 유용할듯.) 호출해서 사용하는게 좋다.
const noClickedCardColor = Color(0xFF1D1E33);
const ClickedCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = noClickedCardColor;
  Color femaleCardColor = noClickedCardColor;

  //1 = male, 2 = female
  void updateColor(int gender) {
    if (gender == 1) {
      //일단 다른성별 초기화해준 후에 체크하기.
      femaleCardColor = noClickedCardColor;
      if (maleCardColor == noClickedCardColor) {
        maleCardColor = ClickedCardColor;
      } else {
        maleCardColor = noClickedCardColor;
      }
    } else {
      maleCardColor = noClickedCardColor;
      if (femaleCardColor == noClickedCardColor) {
        femaleCardColor = ClickedCardColor;
      } else {
        femaleCardColor = noClickedCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    //TextButton이 갖고있는 default margin때문에 제스쳐감지를 사용.
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: IconContent(
                        contentIcon: FontAwesomeIcons.mars,
                        contentLabel: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: IconContent(
                        contentIcon: FontAwesomeIcons.venus,
                        contentLabel: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: noClickedCardColor,
                    cardChild: Container(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: noClickedCardColor,
                    cardChild: Container(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: noClickedCardColor,
                    cardChild: Container(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
