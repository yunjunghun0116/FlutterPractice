// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteUser _$InviteUserFromJson(Map<String, dynamic> json) {
  return InviteUser(
    id: json['id'] as int,
    memberId: json['memberId'] as int,
    recommendName: json['recommendName'] as String,
    recommendMobile: json['recommendMobile'] as String,
    recommendCode: json['recommendCode'] as String,
    codeUsed: json['codeUsed'] as bool?,
    createdAt: json['createdAt'] as int,
    deleted: json['deleted'] as bool,
    benefitFlag: json['benefitFlag'] as bool,
  );
}

Map<String, dynamic> _$InviteUserToJson(InviteUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'recommendName': instance.recommendName,
      'recommendMobile': instance.recommendMobile,
      'recommendCode': instance.recommendCode,
      'codeUsed': instance.codeUsed,
      'createdAt': instance.createdAt,
      'deleted': instance.deleted,
      'benefitFlag': instance.benefitFlag,
    };
