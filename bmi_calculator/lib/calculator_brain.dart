import 'dart:math';

class Calculator_brain{
  final int height;
  final int weight;
  double _bmi;
  Calculator_brain({this.height,this.weight});

  String calculateBMI(){
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);//1자리까지만 자르는것
  }

  String getResult(){
    if(_bmi >= 25) return '비만';
    else if(_bmi >= 23.0) return '과체중';
    else if(_bmi >= 18.5) return '정상';
    else return '저체중';
  }

  String getInterpretation(){
    if(_bmi >= 25) return '살고싶으면 먹는양좀 줄이세요.';
    else if(_bmi >= 23.0) return '먹는양좀 줄이세요.';
    else if(_bmi >= 18.5) return '정상, 축하드립니다.';
    else return '많이 먹으세요.';
  }
}