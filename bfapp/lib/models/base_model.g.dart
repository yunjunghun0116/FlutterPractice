// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel(
    status: json['status'] as String,
    message: json['message'] as String,
    redirect: json['redirect'] as String,
  );
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'redirect': instance.redirect,
    };
