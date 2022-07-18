import 'package:json_annotation/json_annotation.dart';
part 'invite_goods.g.dart';

@JsonSerializable()
class InviteGoods {
  final int id;
  final String name;
  final String shortDesc;
  final String bfCode;
  final String listImage;

  InviteGoods({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.bfCode,
    required this.listImage
  });

  factory InviteGoods.fromJson(json) => _$InviteGoodsFromJson(json);
  Map<String, dynamic> toJson() => _$InviteGoodsToJson(this);
}
