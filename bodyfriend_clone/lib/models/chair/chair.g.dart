// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chair _$ChairFromJson(Map<String, dynamic> json) => Chair(
      id: json['id'] as int,
      name: json['name'] as String,
      shortDesc: json['shortDesc'] as String,
      listImage: json['listImage'] as String,
      price: json['price'] as int,
      rentPrice: json['rentPrice'] as int,
      popularScore: json['popularScore'] as int,
      detailImage: json['detailImage'] as List<dynamic>,
      salesCount: json['salesCount'] as int,
      goodsInfo: json['goodsInfo'] as String,
    );

Map<String, dynamic> _$ChairToJson(Chair instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDesc': instance.shortDesc,
      'listImage': instance.listImage,
      'price': instance.price,
      'rentPrice': instance.rentPrice,
      'popularScore': instance.popularScore,
      'detailImage': instance.detailImage,
      'salesCount': instance.salesCount,
      'goodsInfo': instance.goodsInfo,
    };
