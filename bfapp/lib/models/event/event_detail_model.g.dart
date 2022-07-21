// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetail _$EventDetailFromJson(Map<String, dynamic> json) => EventDetail(
      status: json['status'] as String,
      message: json['message'] as String,
      redirect: json['redirect'] as String,
      data: EventContent.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDetailToJson(EventDetail instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'redirect': instance.redirect,
      'data': instance.data,
    };
