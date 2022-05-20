import 'package:flutter_html/flutter_html.dart';

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

  VIPClass({
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
    required this.price,
  });

  factory VIPClass.fromJson(Map<String, dynamic> json) {
    return VIPClass(
      id: json['id'],
      title: json['title'],
      detailImage: json['detailImage'],
      eventDate: json['eventDate'],
      stateAddress: json['stateAddress'],
      placeName: json['placeName'],
      eventStartTime: json['eventStartTime'],
      eventEndTime: json['eventEndTime'],
      eventMinute: json['eventMinute'],
      applyStartDate: json['applyStartDate'],
      applyEndDate: json['applyEndDate'],
      price: json['price'],
    );
  }
}
