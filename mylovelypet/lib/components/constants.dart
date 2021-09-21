import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


//Style
final feedTimeTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: Colors.black.withOpacity(0.7),
);
final feedTimeSelected = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: Colors.black.withOpacity(0.7),
  decoration: TextDecoration.lineThrough,
);
//Function
String dateFormatting(DateTime dates){
  return DateFormat.y().add_Md().add_Hm().format(dates);
}

