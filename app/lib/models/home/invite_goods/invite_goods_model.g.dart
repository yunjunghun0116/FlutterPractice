// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_goods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteGoods _$InviteGoodsFromJson(Map<String, dynamic> json) {
  return InviteGoods(
    id: json['id'] as int,
    name: json['name'] as String,
    shortDesc: json['shortDesc'] as String,
    bfCode: json['bfCode'] as String,
    listImage: json['listImage'] as String,
  );
}

Map<String, dynamic> _$InviteGoodsToJson(InviteGoods instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDesc': instance.shortDesc,
      'bfCode': instance.bfCode,
      'listImage': instance.listImage,
    };
