import 'package:flutter_test/flutter_test.dart';
import 'package:record_moment/constants.dart';
import 'package:record_moment/utilities/local_date_utils.dart';

void main() {
  test('DateUtilsTest', (){
    LocalDateUtils localDateUtils = LocalDateUtils();

    expect(localDateUtils.getDayLength(2016, 2),29);
    expect(localDateUtils.getDayLength(2017, 2),28);
    expect(localDateUtils.getDayLength(2022, 11),30);

    expect(kYearList[100], 2000);
  });
}
