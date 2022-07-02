// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteHistory _$InviteHistoryFromJson(Map<String, dynamic> json) =>
    InviteHistory(
      content: json['content'] as List<dynamic>,
      pageable: json['pageable'] as Map<String, dynamic>,
      first: json['first'] as bool,
      last: json['last'] as bool,
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
      sort: json['sort'] as Map<String, dynamic>,
      numberOfElements: json['numberOfElements'] as int,
      size: json['size'] as int,
      number: json['number'] as int,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$InviteHistoryToJson(InviteHistory instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'first': instance.first,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'number': instance.number,
      'empty': instance.empty,
    };
