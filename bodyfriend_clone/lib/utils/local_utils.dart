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

String getDateTime(int times){
  DateTime _dateTime = DateTime.fromMillisecondsSinceEpoch(times*1000);
  return '${_dateTime.year}.${_dateTime.month >= 10?_dateTime.month:'0${_dateTime.month}'}.${_dateTime.day >= 10?_dateTime.day:'0${_dateTime.day}'}';
}