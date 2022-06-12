import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String name;
  final String icon; //iconUrl
  final String type;
  final int displayNo;
  final bool deleted;
  final String createdBy;
  final DateTime createdAt;
  final String? modifiedBy;
  final DateTime? modifiedAt;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
    required this.displayNo,
    required this.deleted,
    required this.createdBy,
    required this.createdAt,
    this.modifiedBy,
    this.modifiedAt,
  });

  factory Category.fromJson(json) => _$CategoryFromJson(json);
  Map<String,dynamic> toJson() =>_$CategoryToJson(this);
}
