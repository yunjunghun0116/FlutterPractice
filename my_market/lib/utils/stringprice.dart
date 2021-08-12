import 'package:intl/intl.dart';

String calcStringToWon(String priceString) {
  if(priceString == '무료나눔') return priceString;
  final oCcy = new NumberFormat('#,###', 'ko_KR');
  return '${oCcy.format(int.parse(priceString))}원';
}