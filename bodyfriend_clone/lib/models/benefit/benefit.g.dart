// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'benefit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Benefit _$BenefitFromJson(Map<String, dynamic> json) => Benefit(
      text: json['text'] as String,
      highlight: json['highlight'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$BenefitToJson(Benefit instance) => <String, dynamic>{
      'text': instance.text,
      'highlight': instance.highlight,
      'color': instance.color,
    };
