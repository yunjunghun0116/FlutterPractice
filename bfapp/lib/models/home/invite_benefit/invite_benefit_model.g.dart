// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_benefit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteBenefit _$InviteBenefitFromJson(Map<String, dynamic> json) =>
    InviteBenefit(
      recordNumber: json['recordNumber'] as int,
      recommendBenefitId: json['recommendBenefitId'] as int?,
      goodsList: json['goodsList'] as List<dynamic>,
      provided: json['provided'] as bool,
    );

Map<String, dynamic> _$InviteBenefitToJson(InviteBenefit instance) =>
    <String, dynamic>{
      'recordNumber': instance.recordNumber,
      'recommendBenefitId': instance.recommendBenefitId,
      'goodsList': instance.goodsList,
      'provided': instance.provided,
    };
