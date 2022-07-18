

import 'package:json_annotation/json_annotation.dart';

part 'version_model.g.dart';

@JsonSerializable()
class VersionRoot {
  String status;
  String message;
  String redirect;
  VersionData? data;

  VersionRoot({
    required this.status,
    required this.message,
    required this.redirect,
    this.data
  });
  factory VersionRoot.fromJson(Map<String, dynamic> json) => _$VersionRootFromJson(json);

  Map<String, dynamic> toJson() => _$VersionRootToJson(this);
}

@JsonSerializable()
class VersionData {
  String key;
  String value1;
  String? value2;
  String? value3;
  String? value4;

  VersionData({
    required this.key,
    required this.value1,
    this.value2,
    this.value3,
    this.value4,
  });

  factory VersionData.fromJson(Map<String, dynamic> json) =>
      _$VersionDataFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDataToJson(this);
}