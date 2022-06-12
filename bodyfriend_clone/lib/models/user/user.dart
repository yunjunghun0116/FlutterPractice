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

  User({
    required this.loginId,
    required this.accessToken,
    required this.refreshToken,
    required this.name,
    required this.mobile,
    required this.id,
    required this.memberGradeType,
  });

  factory User.fromJson(json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}
