// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VIPClass _$VIPClassFromJson(Map<String, dynamic> json) => VIPClass(
      id: json['id'] as int,
      title: json['title'] as String,
      detailImage: json['detailImage'] as String,
      eventDate: json['eventDate'] as int,
      stateAddress: json['stateAddress'] as String,
      placeName: json['placeName'] as String,
      eventStartTime: json['eventStartTime'] as String,
      eventEndTime: json['eventEndTime'] as String,
      eventMinute: json['eventMinute'] as String,
      applyStartDate: json['applyStartDate'] as int,
      applyEndDate: json['applyEndDate'] as int,
      price: json['price'] as int,
      status: json['status'] as String,
      imageForm: json['imageForm'] as String?,
      applied: json['applied'] as bool?,
    );

Map<String, dynamic> _$VIPClassToJson(VIPClass instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'detailImage': instance.detailImage,
      'eventDate': instance.eventDate,
      'stateAddress': instance.stateAddress,
      'placeName': instance.placeName,
      'eventStartTime': instance.eventStartTime,
      'eventEndTime': instance.eventEndTime,
      'eventMinute': instance.eventMinute,
      'applyStartDate': instance.applyStartDate,
      'applyEndDate': instance.applyEndDate,
      'price': instance.price,
      'status': instance.status,
      'imageForm': instance.imageForm,
      'applied': instance.applied,
    };
