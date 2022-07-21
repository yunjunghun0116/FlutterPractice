// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashRoot _$SplashRootFromJson(Map<String, dynamic> json) => SplashRoot(
      status: json['status'] as String,
      message: json['message'] as String,
      redirect: json['redirect'] as String,
      data: json['data'] == null
          ? null
          : SplashData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SplashRootToJson(SplashRoot instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'redirect': instance.redirect,
      'data': instance.data,
    };

SplashData _$SplashDataFromJson(Map<String, dynamic> json) => SplashData(
      id: json['id'] as int,
      imageBanner: json['imageBanner'] as String,
    );

Map<String, dynamic> _$SplashDataToJson(SplashData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageBanner': instance.imageBanner,
    };
