import 'package:json_annotation/json_annotation.dart';

part 'auto_login_user.g.dart';
@JsonSerializable()
class AutoLoginUser {

  /*
   * userIdx: 205915,
  * userId: leedg5845,
  * userName: 이동근,
  * autoLogin: false,
  * bftk: THNj2jI0hdhFaKMSYedRD6oV11f1rvYt4qSp1OxLgzg=,
  * bfrt: Vn5PI3lcJHp6sgvF4NIu3De7ddxOLTMDeMQ0Ks7pSbs=
  * */
  final String userIdx;
  final String userId;
  final String userName;
  final bool autoLogin;
  final String bftk;
  final String bfrt;

  AutoLoginUser({
    required this.userIdx,
    required this.userId,
    required this.userName,
    required this.autoLogin,
    required this.bftk,
    required this.bfrt,
  });

  factory AutoLoginUser.fromJson(Map<String, dynamic> json) =>
      _$AutoLoginUserFromJson(json);
  Map<String, dynamic> toJson() => _$AutoLoginUserToJson(this);
}
