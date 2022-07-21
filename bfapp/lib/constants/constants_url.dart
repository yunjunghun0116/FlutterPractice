import 'package:flutter/foundation.dart';

const String baseUrl = kDebugMode
    ? 'https://dapi.bodyfriend.co.kr'
    : 'https://membership.bodyfriend.me';

const String baseWebUrl =
    kDebugMode ? 'http://d.bodyfriend.co.kr' : 'http://mw.bodyfriend.me';

const String loginUrl = kDebugMode
    ? 'https://auth.bodyfriend.co.kr/'
    : 'https://tauth.bodyfriend.co.kr/';

const String bftkUrl = '$loginUrl/api/auth/token';
const String bfrtUrl = '$loginUrl/api/auth/token/refresh';

const String detailWebUrl = '$baseWebUrl/event/detail?';
