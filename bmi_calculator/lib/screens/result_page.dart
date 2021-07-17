import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../calculator_brain.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultPage({@required this.resultText,@required this.bmiResult,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Result',
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: noClickedCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: resultTextStyle,
                  ),
                  Text(
                    resultText,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
          BottomButton(onPressedFunc: (){
            Navigator.pop(context);
          }, buttonText: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
