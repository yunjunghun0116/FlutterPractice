import 'package:app/models/event/event_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_detail_model.g.dart';

@JsonSerializable()
class EventDetail {
  String status;
  String message;
  String redirect;
  EventContent data;

  EventDetail({
    required this.status,
    required this.message,
    required this.redirect,
    required this.data,
  });

  factory EventDetail.fromJson(Map<String, dynamic> json) => _$EventDetailFromJson(json);
  Map<String, dynamic> toJson() => _$EventDetailToJson(this);
}
