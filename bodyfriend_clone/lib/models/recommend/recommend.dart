import 'package:json_annotation/json_annotation.dart';
part 'recommend.g.dart';

@JsonSerializable()
class Recommend {
  final int recommendNumber;
  final int reward;
  final int receiveNumber;
  final int nextBenefitNumber;

  Recommend(
      {required this.recommendNumber,
      required this.reward,
      required this.receiveNumber,
      required this.nextBenefitNumber,});

  factory Recommend.fromJson(json) => _$RecommendFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendToJson(this);
}
