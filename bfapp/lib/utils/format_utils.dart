import 'package:app/constants/constants.dart';

String getPrice(int price) {
  return kPriceNumberFormat.format(price);
}

// 휴대전화번호 정규식
RegExp kNumberRegExp =
    RegExp('^(010|011|016|017|018|019)([0-9]{3,4})([0-9]{4})');
