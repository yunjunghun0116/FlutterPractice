import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const noImageUrl =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Noimage.svg/260px-Noimage.svg.png';

const basicColor = Color(0xff21254A);

//Style
final feedTimeTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.black.withOpacity(0.7),
);
final feedTimeSelected = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.black.withOpacity(0.7),
  decoration: TextDecoration.lineThrough,
);

final whiteButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
  elevation: MaterialStateProperty.all(5),
);

//loginScreen
final loginButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(
    Colors.purpleAccent,
  ),
);
final loginTextStyle = TextStyle(
  fontSize: 12.0,
  fontStyle: FontStyle.italic,
);
Text mainTitleText(String titles){
  return Text(
    titles,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.yellowAccent,
    ),
    textAlign: TextAlign.center,
  );
}
//Function
String dateFormatting(DateTime dates) {
  return DateFormat.y().add_Md().add_Hm().format(dates);
}

String dateFormattingWithYearAndMd(DateTime dates) {
  return DateFormat.y().add_Md().format(dates);
}

String dateFormattingWithMdh(String dates) {
  DateTime parsedDate = DateTime.parse(dates);
  return DateFormat.Md().add_Hm().format(parsedDate);
}
