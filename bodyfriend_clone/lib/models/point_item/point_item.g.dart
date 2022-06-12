// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointItem _$PointItemFromJson(Map<String, dynamic> json) => PointItem(
      id: json['id'] as int,
      name: json['name'] as String,
      shortDesc: json['shortDesc'] as String,
      listImage: json['listImage'] as String,
      price: json['price'] as int,
      reducePrice: json['reducePrice'] as int?,
      popularScore: json['popularScore'] as int,
      detailImage: json['detailImage'] as List<dynamic>,
      goodsInfo: json['goodsInfo'] as String,
    );

Map<String, dynamic> _$PointItemToJson(PointItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDesc': instance.shortDesc,
      'listImage': instance.listImage,
      'price': instance.price,
      'reducePrice': instance.reducePrice,
      'popularScore': instance.popularScore,
      'detailImage': instance.detailImage,
      'goodsInfo': instance.goodsInfo,
    };
