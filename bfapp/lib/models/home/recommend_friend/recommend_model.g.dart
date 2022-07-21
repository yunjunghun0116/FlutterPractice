// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommend _$RecommendFromJson(Map<String, dynamic> json) => Recommend(
      recommendNumber: json['recommendNumber'] as int,
      reward: json['reward'] as int,
      receiveNumber: json['receiveNumber'] as int,
      nextBenefitNumber: json['nextBenefitNumber'] as int,
    );

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'recommendNumber': instance.recommendNumber,
      'reward': instance.reward,
      'receiveNumber': instance.receiveNumber,
      'nextBenefitNumber': instance.nextBenefitNumber,
    };
