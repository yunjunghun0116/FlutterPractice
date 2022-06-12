import 'package:bodyfriend_clone/models/event_banner/event_banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_banner_list.g.dart';
@JsonSerializable()
class EventBannerList{
  List<EventBanner> bannerList;

  EventBannerList({
    required this.bannerList
});

  factory EventBannerList.fromJson(Map<String,dynamic> json)=>_$EventBannerListFromJson(json);
  Map<String,dynamic> toJson() => _$EventBannerListToJson(this);

}