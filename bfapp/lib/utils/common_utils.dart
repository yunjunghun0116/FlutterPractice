
import 'dart:io';

import 'package:launch_review/launch_review.dart';

class Utils {

  static void linkAppStore() {
    LaunchReview.launch(
        androidAppId: 'kr.co.bodyfriend.membershipapp',
        iOSAppId: '1528685553'
    );
  }

  static String getOS() {
    return Platform.isAndroid ? 'android' : 'ios';
  }
}