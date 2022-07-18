// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionRoot _$VersionRootFromJson(Map<String, dynamic> json) {
  return VersionRoot(
    status: json['status'] as String,
    message: json['message'] as String,
    redirect: json['redirect'] as String,
    data: json['data'] == null
        ? null
        : VersionData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VersionRootToJson(VersionRoot instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'redirect': instance.redirect,
      'data': instance.data,
    };

VersionData _$VersionDataFromJson(Map<String, dynamic> json) {
  return VersionData(
    key: json['key'] as String,
    value1: json['value1'] as String,
    value2: json['value2'] as String?,
    value3: json['value3'] as String?,
    value4: json['value4'] as String?,
  );
}

Map<String, dynamic> _$VersionDataToJson(VersionData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value1': instance.value1,
      'value2': instance.value2,
      'value3': instance.value3,
      'value4': instance.value4,
    };
