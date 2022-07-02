import 'package:json_annotation/json_annotation.dart';
part 'invite_user.g.dart';

@JsonSerializable()
class InviteUser {
  final int id;
  final int memberId;
  final String recommendName;
  final String recommendMobile;
  final String recommendCode;
  final bool? codeUser;
  final int createdAt;
  final bool deleted;
  final bool benefitFlag;
  InviteUser({
    required this.id,
    required this.memberId,
    required this.recommendName,
    required this.recommendMobile,
    required this.recommendCode,
    required this.codeUser,
    required this.createdAt,
    required this.deleted,
    required this.benefitFlag,
  });

  factory InviteUser.fromJson(Map<String, dynamic> json) =>
      _$InviteUserFromJson(json);
  Map<String, dynamic> toJson() => _$InviteUserToJson(this);
}
