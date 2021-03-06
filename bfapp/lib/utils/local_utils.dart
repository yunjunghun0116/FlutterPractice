import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

String timeDifference(
  int onSleepHours,
  int onSleepMinutes,
  int onAwakeHours,
  int onAwakeMinutes,
) {
  int differenceTime =
      (onAwakeHours - onSleepHours) * 60 + (onAwakeMinutes - onSleepMinutes);
  if (differenceTime < 0) {
    differenceTime += 1440;
  }
  int hours = (differenceTime / 60).floor();
  int minutes = differenceTime % 60;
  return '${hours >= 10 ? hours : '0$hours'}:${minutes >= 10 ? minutes : '0$minutes'}';
}

String getDateTime(int times) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(times * 1000);
  return '${dateTime.year}.${dateTime.month >= 10 ? dateTime.month : '0${dateTime.month}'}.${dateTime.day >= 10 ? dateTime.day : '0${dateTime.day}'}';
}

String getApplyDateTime(int startTimes, int endTimes) {
  DateTime startApplyDateTime =
      DateTime.fromMillisecondsSinceEpoch(startTimes * 1000);
  DateTime endApplyDateTime =
      DateTime.fromMillisecondsSinceEpoch(endTimes * 1000);
  if (endApplyDateTime.year != startApplyDateTime.year) {
    return '${getDateTime(startTimes)} ~ ${getDateTime(endTimes)}';
  }
  return '${getDateTime(startTimes)} ~ ${getDateTime(endTimes).substring(5)}';
}

Text getTextWithBenefits(Map<String, dynamic> benefit) {
  List<String> textList = benefit['text'].split(' ');
  return Text('');
}

List<DateTime> getPointFilterList() {
  DateTime nowDateTime = DateTime.now();
  DateTime startDateTime = DateTime(2014, 3);
  List<DateTime> filterList = [];

  while (checkGetPointFilterListIsEnd(startDateTime, nowDateTime)) {
    filterList.add(startDateTime);
    if (startDateTime.month == 12) {
      startDateTime = DateTime(startDateTime.year + 1, 1);
      continue;
    }
    startDateTime = DateTime(startDateTime.year, startDateTime.month + 1);
  }
  print('first : ${filterList.first}');
  print('end : ${filterList.last}');
  return filterList.reversed.toList();
}

bool checkGetPointFilterListIsEnd(
    DateTime checkDateTime, DateTime nowDateTime) {
  if (nowDateTime.year == checkDateTime.year &&
      nowDateTime.month - checkDateTime.month < 1) {
    return false;
  }
  return true;
}

String getCategoryInPointHistory(String category) {
  switch (category) {
    case 'HEALTH':
      return '??????';
    default:
      return '???????????????';
  }
}

String decryptToken(String token){
  String secretKey = "a&9fql3@jDAE2f8#";

  final key = encrypt.Key.fromUtf8(secretKey);
  final iv = encrypt.IV(key.bytes);
  final encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));

  final decryptedData = encrypter.decrypt64(token, iv: iv);
  return decryptedData;
}

int getTimerTime(int time){
  DateTime applyTime =
  DateTime.fromMillisecondsSinceEpoch(time * 1000); //?????? 4??? now() -> ?????? 9??? 5?????? -> 300??? -> 18000??? 7200??? : 2??????
  return DateTime.now().difference(applyTime).inSeconds;
}

String getTimeWithTimerTime(int times){
  int hours = times~/3600;
  int minutes = (times%3600)~/60;
  int seconds = times%60;

  return '$hours:${minutes >= 10 ? minutes : '0$minutes'}:${seconds >= 10 ? seconds : '0$seconds'}';
}

