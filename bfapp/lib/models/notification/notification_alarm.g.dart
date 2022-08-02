// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationAlarm _$NotificationAlarmFromJson(Map<String, dynamic> json) =>
    NotificationAlarm(
      id: json['id'] as int,
      alarmCategory: json['alarmCategory'] as String,
      title: json['title'] as String,
      contents: json['contents'] as String,
      vctype: json['vctype'] as String,
      vcid: json['vcid'] as int,
      cratedAt: json['cratedAt'] as int,
    );

Map<String, dynamic> _$NotificationAlarmToJson(NotificationAlarm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alarmCategory': instance.alarmCategory,
      'title': instance.title,
      'contents': instance.contents,
      'vctype': instance.vctype,
      'vcid': instance.vcid,
      'cratedAt': instance.cratedAt,
    };
