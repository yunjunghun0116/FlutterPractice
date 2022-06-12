// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBanner _$EventBannerFromJson(Map<String, dynamic> json) => EventBanner(
      eventId: json['eventId'] as int,
      mainBannerType: json['mainBannerType'] as String,
      homeBannerImage: json['homeBannerImage'] as String,
    );

Map<String, dynamic> _$EventBannerToJson(EventBanner instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'mainBannerType': instance.mainBannerType,
      'homeBannerImage': instance.homeBannerImage,
    };
