class User {
  final int id;
  final String loginId;
  final String accessToken;
  final String refreshToken;
  final String name;
  final String mobile;
  final String memberGradeType;

  User({
    required this.id,
    required this.loginId,
    required this.accessToken,
    required this.refreshToken,
    required this.name,
    required this.mobile,
    required this.memberGradeType,
  });

  factory User.fromJson(json) => User(
        id: json['id'],
        loginId: json['loginId'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        name: json['name'],
        mobile: json['mobile'],
        memberGradeType: json['memberGradeType'],
      );
}
