// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoLoginUser _$AutoLoginUserFromJson(Map<String, dynamic> json) =>
    AutoLoginUser(
      userIdx: json['userIdx'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      autoLogin: json['autoLogin'] as bool,
      bftk: json['bftk'] as String,
      bfrt: json['bfrt'] as String,
    );

Map<String, dynamic> _$AutoLoginUserToJson(AutoLoginUser instance) =>
    <String, dynamic>{
      'userIdx': instance.userIdx,
      'userId': instance.userId,
      'userName': instance.userName,
      'autoLogin': instance.autoLogin,
      'bftk': instance.bftk,
      'bfrt': instance.bfrt,
    };
