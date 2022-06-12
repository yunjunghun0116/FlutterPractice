import 'package:json_annotation/json_annotation.dart';
part 'vip_class.g.dart';

@JsonSerializable()
class VIPClass {
  final int id;
  final String title;
  final String detailImage;
  final int eventDate;
  final String stateAddress;
  final String placeName;
  final String eventStartTime;
  final String eventEndTime;
  final String eventMinute;
  final int applyStartDate;
  final int applyEndDate;
  final int price;
  final String status;
  final String? imageForm;
  final bool? applied;

  VIPClass( {
    required this.id,
    required this.title,
    required this.detailImage,
    required this.eventDate,
    required this.stateAddress,
    required this.placeName,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventMinute,
    required this.applyStartDate,
    required this.applyEndDate,
    required this.price,required this.status, required this.imageForm, required this.applied,
  });

  factory VIPClass.fromJson(Map<String, dynamic> json) =>_$VIPClassFromJson(json);
  Map<String,dynamic> toJson()=>_$VIPClassToJson(this);
}
