// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteUser _$InviteUserFromJson(Map<String, dynamic> json) => InviteUser(
      id: json['id'] as int,
      memberId: json['memberId'] as int,
      recommendName: json['recommendName'] as String,
      recommendMobile: json['recommendMobile'] as String,
      recommendCode: json['recommendCode'] as String,
      codeUser: json['codeUser'] as bool?,
      createdAt: json['createdAt'] as int,
      deleted: json['deleted'] as bool,
      benefitFlag: json['benefitFlag'] as bool,
    );

Map<String, dynamic> _$InviteUserToJson(InviteUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'recommendName': instance.recommendName,
      'recommendMobile': instance.recommendMobile,
      'recommendCode': instance.recommendCode,
      'codeUser': instance.codeUser,
      'createdAt': instance.createdAt,
      'deleted': instance.deleted,
      'benefitFlag': instance.benefitFlag,
    };
