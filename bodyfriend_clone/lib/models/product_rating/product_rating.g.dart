// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRating _$ProductRatingFromJson(Map<String, dynamic> json) =>
    ProductRating(
      startPoint: (json['startPoint'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
    );

Map<String, dynamic> _$ProductRatingToJson(ProductRating instance) =>
    <String, dynamic>{
      'startPoint': instance.startPoint,
      'reviewCount': instance.reviewCount,
    };
