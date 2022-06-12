// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      loginId: json['loginId'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      id: json['id'] as int,
      memberGradeType: json['memberGradeType'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'loginId': instance.loginId,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'name': instance.name,
      'mobile': instance.mobile,
      'memberGradeType': instance.memberGradeType,
    };
