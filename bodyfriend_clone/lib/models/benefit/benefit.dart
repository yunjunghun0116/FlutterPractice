import 'package:json_annotation/json_annotation.dart';
part 'benefit.g.dart';

@JsonSerializable()
class Benefit {
  final String text;
  final String highlight;
  final String color;

  Benefit({
    required this.text,
    required this.highlight,
    required this.color,
  });

  factory Benefit.fromJson(json) => _$BenefitFromJson(json);
  Map<String, dynamic> toJson() => _$BenefitToJson(this);
}
