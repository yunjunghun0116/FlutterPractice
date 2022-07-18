import 'package:json_annotation/json_annotation.dart';
part 'invite_benefit.g.dart';

@JsonSerializable()
class InviteBenefit {
  final int recordNumber;
  final int? recommendBenefitId;
  final List goodsList;
  final bool provided;

  InviteBenefit({
    required this.recordNumber,
    required this.recommendBenefitId,
    required this.goodsList,
    required this.provided
  });

  factory InviteBenefit.fromJson(json) => _$InviteBenefitFromJson(json);
  Map<String, dynamic> toJson() => _$InviteBenefitToJson(this);
}
