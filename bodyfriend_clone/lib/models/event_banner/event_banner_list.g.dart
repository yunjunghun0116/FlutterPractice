// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_banner_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBannerList _$EventBannerListFromJson(Map<String, dynamic> json) =>
    EventBannerList(
      bannerList: (json['bannerList'] as List<dynamic>)
          .map((e) => EventBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventBannerListToJson(EventBannerList instance) =>
    <String, dynamic>{
      'bannerList': instance.bannerList,
    };
