import 'package:intl/intl.dart';

String calcStringToWon(String priceString) {
  final oCcy = new NumberFormat('#,###', 'ko_KR');
  return '${oCcy.format(int.parse(priceString))}원';
}