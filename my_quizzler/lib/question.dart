class Question{
  String questionText;
  bool questionAnswer;

  Question(this.questionText,this.questionAnswer);

}

//Question({String q,bool a}){}이런식으로 생성해서 하는게 코드보기가 조금 더 편함
//다만 이경우는 생성시 Question('abc',true)가 아닌 Question(q:'abc',a:true)처럼 생성해야함
//혹은 위처럼 바로 {questionText = q,questionAnswer = a}를 해줄필요없이
//this연산자를 통해 바로 지정해줄수도있음.