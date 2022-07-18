

import 'package:json_annotation/json_annotation.dart';

part 'splash_model.g.dart';

@JsonSerializable()
class SplashRoot {
  String status;
  String message;
  String redirect;
  SplashData? data;

  SplashRoot({
    required this.status,
    required this.message,
    required this.redirect,
    this.data
  });

  factory SplashRoot.fromJson(Map<String, dynamic> json) => _$SplashRootFromJson(json);

  Map<String, dynamic> toJson() => _$SplashRootToJson(this);
}

@JsonSerializable()
class SplashData {
  int id;
  String imageBanner;

  SplashData({
    required this.id,
    required this.imageBanner,
  });

  factory SplashData.fromJson(Map<String, dynamic> json) =>
      _$SplashDataFromJson(json);

  Map<String, dynamic> toJson() => _$SplashDataToJson(this);
}