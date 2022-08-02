import 'package:json_annotation/json_annotation.dart';
part 'notification_alarm.g.dart';

@JsonSerializable()
class NotificationAlarm {
  final int id;
  final String alarmCategory;
  final String title;
  final String contents;
  final String vctype;
  final int vcid;
  final int cratedAt;

  NotificationAlarm(
      {required this.id,
      required this.alarmCategory,
      required this.title,
      required this.contents,
      required this.vctype,
      required this.vcid,
      required this.cratedAt});

  factory NotificationAlarm.fromJson(Map<String, dynamic> json) =>
      _$NotificationAlarmFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationAlarmToJson(this);
}
