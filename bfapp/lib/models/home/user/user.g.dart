// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      loginId: json['loginId'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      memberGradeType: json['memberGradeType'] as String,
      email: json['email'] as String?,
      birthDay: json['birthDay'] as String?,
      socialType: json['socialType'] as String?,
      bftk: json['bftk'] as String?,
      bfrt: json['bfrt'] as String?,
      badgeYn: json['badgeYn'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'loginId': instance.loginId,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'name': instance.name,
      'mobile': instance.mobile,
      'memberGradeType': instance.memberGradeType,
      'email': instance.email,
      'birthDay': instance.birthDay,
      'socialType': instance.socialType,
      'bftk': instance.bftk,
      'bfrt': instance.bfrt,
      'badgeYn': instance.badgeYn,
    };
