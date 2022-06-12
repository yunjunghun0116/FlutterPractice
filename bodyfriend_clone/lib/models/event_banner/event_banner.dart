import 'package:json_annotation/json_annotation.dart';
part 'event_banner.g.dart';

@JsonSerializable()
class EventBanner {
  //final const -> 이 값은 정해진 값으로써 이후 수정이 불가능하다
  //생성 -> 값이 필수
  int eventId;
  String mainBannerType;
  String homeBannerImage;

  EventBanner({
    required this.eventId ,
    required this.mainBannerType,
    required this.homeBannerImage,
  });

  //객체지향설계 - 디자인패턴
  //객체를 생성하는 방식을 정의한다
  // 1. 생성자를 통한 객체 생성 방식
  // 2. 팩토리패턴을 통한 객체 생성 방식 -> 생성자 접근
  // Map<String,dynamic> json

  factory EventBanner.fromJson(Map<String,dynamic> json)=>_$EventBannerFromJson(json);
  Map<String,dynamic> toJson() => _$EventBannerToJson(this);
}
