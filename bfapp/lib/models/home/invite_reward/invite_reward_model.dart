import 'package:json_annotation/json_annotation.dart';

part 'invite_reward.g_model.dart';

@JsonSerializable()
class InviteReward {
  final int recommendNumber;
  final int reward;
  final int nextBenefitNumber;
  final int benefitMaxNumber;
  final List confirmList;
  final List benefitNumberList;

  InviteReward({
    required this.recommendNumber,
    required this.reward,
    required this.nextBenefitNumber,
    required this.benefitMaxNumber,
    required this.confirmList,
    required this.benefitNumberList,
  });

  factory InviteReward.fromJson(Map<String, dynamic> json) =>
      _$InviteRewardFromJson(json);

  Map<String, dynamic> toJson() => _$InviteRewardToJson(this);
}
