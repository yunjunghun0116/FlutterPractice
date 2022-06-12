// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      type: json['type'] as String,
      displayNo: json['displayNo'] as int,
      deleted: json['deleted'] as bool,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      modifiedBy: json['modifiedBy'] as String?,
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'type': instance.type,
      'displayNo': instance.displayNo,
      'deleted': instance.deleted,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'modifiedBy': instance.modifiedBy,
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
    };
