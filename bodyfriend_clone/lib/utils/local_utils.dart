import 'package:flutter/material.dart';

String timeDifference(
  int onSleepHours,
  int onSleepMinutes,
  int onAwakeHours,
  int onAwakeMinutes,
) {
  int _differenceTime =
      (onAwakeHours - onSleepHours) * 60 + (onAwakeMinutes - onSleepMinutes);
  if (_differenceTime < 0) {
    _differenceTime += 1440;
  }
  int _hours = (_differenceTime / 60).floor();
  int _minutes = _differenceTime % 60;
  return '${_hours >= 10 ? _hours : '0$_hours'}:${_minutes >= 10 ? _minutes : '0$_minutes'}';
}

String getDateTime(int times) {
  DateTime _dateTime = DateTime.fromMillisecondsSinceEpoch(times * 1000);
  return '${_dateTime.year}.${_dateTime.month >= 10 ? _dateTime.month : '0${_dateTime.month}'}.${_dateTime.day >= 10 ? _dateTime.day : '0${_dateTime.day}'}';
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

String getCategoryInPointHistory(String category){
  switch(category){
    case 'HEALTH':
      return '건강';
    default:
      return '나머지종류';
  }
}
