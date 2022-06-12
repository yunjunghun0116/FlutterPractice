import 'package:json_annotation/json_annotation.dart';
part 'chair.g.dart';

@JsonSerializable()
class Chair {
  final int id;
  final String name;
  final String shortDesc;
  final String listImage;
  final int price;
  final int rentPrice;
  final int popularScore;
  final List detailImage;
  final int salesCount;
  final String goodsInfo;

  Chair({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.listImage,
    required this.price,
    required this.rentPrice,
    required this.popularScore,
    required this.detailImage,
    required this.salesCount,
    required this.goodsInfo,
  });

  factory Chair.fromJson(json) => _$ChairFromJson(json);
  Map<String,dynamic> toJson() => _$ChairToJson(this);
}
