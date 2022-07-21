import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String loginId;
  final String accessToken;
  final String refreshToken;
  final String name;
  final String mobile;
  final String memberGradeType;
  final String? email;
  final String? birthDay;
  final String? socialType;
  final String? bftk;
  final String? bfrt;
  final bool? badgeYn;

  User({
    required this.id,
    required this.loginId,
    required this.accessToken,
    required this.refreshToken,
    required this.name,
    required this.mobile,
    required this.memberGradeType,
    this.email,
    this.birthDay,
    this.socialType,
    this.bftk,
    this.bfrt,
    this.badgeYn,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
