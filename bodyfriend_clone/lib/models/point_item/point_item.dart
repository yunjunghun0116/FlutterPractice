import 'package:json_annotation/json_annotation.dart';
part 'point_item.g.dart';

@JsonSerializable()
class PointItem {
  final int id;
  final String name;
  final String shortDesc;
  final String listImage;
  final int price;
  final int? reducePrice;
  final int popularScore;
  final List detailImage;
  final String goodsInfo;

  PointItem({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.listImage,
    required this.price,
    this.reducePrice,
    required this.popularScore,
    required this.detailImage,
    required this.goodsInfo,
  });

  factory PointItem.fromJson(json) => _$PointItemFromJson(json);
  Map<String, dynamic> toJson() => _$PointItemToJson(this);
}
