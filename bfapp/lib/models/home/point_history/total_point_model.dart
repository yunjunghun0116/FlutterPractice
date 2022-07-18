import 'package:json_annotation/json_annotation.dart';

part 'total_point_model.g.dart';

@JsonSerializable()
class TotalPoint {
  final int amount;

  TotalPoint({
    required this.amount,
  });

  factory TotalPoint.fromJson(json) => _$TotalPointFromJson(json);
  Map<String, dynamic> toJson() => _$TotalPointToJson(this);
}
