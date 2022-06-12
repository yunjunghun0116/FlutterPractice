import 'package:json_annotation/json_annotation.dart';
part 'product_rating.g.dart';

@JsonSerializable()
class ProductRating{
  final double startPoint;
  final int reviewCount;

  ProductRating({required this.startPoint, required this.reviewCount,});

  factory ProductRating.fromJson(json) => _$ProductRatingFromJson(json);
  Map<String,dynamic> toJson() => _$ProductRatingToJson(this);
}