// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteReward _$InviteRewardFromJson(Map<String, dynamic> json) {
  return InviteReward(
    recommendNumber: json['recommendNumber'] as int,
    reward: json['reward'] as int,
    nextBenefitNumber: json['nextBenefitNumber'] as int,
    benefitMaxNumber: json['benefitMaxNumber'] as int,
    confirmList: json['confirmList'] as List<dynamic>,
    benefitNumberList: json['benefitNumberList'] as List<dynamic>,
  );
}

Map<String, dynamic> _$InviteRewardToJson(InviteReward instance) =>
    <String, dynamic>{
      'recommendNumber': instance.recommendNumber,
      'reward': instance.reward,
      'nextBenefitNumber': instance.nextBenefitNumber,
      'benefitMaxNumber': instance.benefitMaxNumber,
      'confirmList': instance.confirmList,
      'benefitNumberList': instance.benefitNumberList,
    };
