// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventList _$EventListFromJson(Map<String, dynamic> json) => EventList(
      status: json['status'] as String,
      message: json['message'] as String,
      redirect: json['redirect'] as String,
      data: json['data'] == null
          ? null
          : EventData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventListToJson(EventList instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'redirect': instance.redirect,
      'data': instance.data,
    };

EventData _$EventDataFromJson(Map<String, dynamic> json) => EventData(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => EventContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as int?,
      totalElements: json['totalElements'] as int?,
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: json['numberOfElements'] as int?,
      first: json['first'] as bool?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$EventDataToJson(EventData instance) => <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'empty': instance.empty,
    };

EventContent _$EventContentFromJson(Map<String, dynamic> json) => EventContent(
      id: json['id'] as int,
      storeInfo: json['storeInfo'],
      startDate: json['startDate'] as int?,
      endDate: json['endDate'] as int?,
      imageBanner: json['imageBanner'] as String?,
      mainImage: json['mainImage'] as String?,
      imageForm: json['imageForm'],
      title: json['title'] as String?,
      contents: json['contents'] as String?,
      progressType: json['progressType'] as String?,
      gradeTypes: (json['gradeTypes'] as List<dynamic>?)
          ?.map((e) => GradeType.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventStatus: json['eventStatus'] as String?,
      regionTypes: json['regionTypes'] as String?,
      eventType: json['eventType'] as String?,
      homeBannerImage: json['homeBannerImage'] as String?,
      homeBannerActive: json['homeBannerActive'] as bool?,
      deleted: json['deleted'] as bool?,
      applyStatus: json['applyStatus'] as bool?,
      isWholeStore: json['isWholeStore'] as bool?,
      applyMemberCount: json['applyMemberCount'],
      viewCount: json['viewCount'] as int?,
      detailImages: json['detailImages'] as List<dynamic>?,
    );

Map<String, dynamic> _$EventContentToJson(EventContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeInfo': instance.storeInfo,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'imageBanner': instance.imageBanner,
      'mainImage': instance.mainImage,
      'imageForm': instance.imageForm,
      'title': instance.title,
      'contents': instance.contents,
      'progressType': instance.progressType,
      'gradeTypes': instance.gradeTypes,
      'eventStatus': instance.eventStatus,
      'regionTypes': instance.regionTypes,
      'eventType': instance.eventType,
      'homeBannerImage': instance.homeBannerImage,
      'homeBannerActive': instance.homeBannerActive,
      'deleted': instance.deleted,
      'applyStatus': instance.applyStatus,
      'isWholeStore': instance.isWholeStore,
      'applyMemberCount': instance.applyMemberCount,
      'viewCount': instance.viewCount,
      'detailImages': instance.detailImages,
    };

GradeType _$GradeTypeFromJson(Map<String, dynamic> json) => GradeType(
      memberGradeType: $enumDecodeNullable(
          _$MemberGradeTypeEnumMap, json['memberGradeType']),
    );

Map<String, dynamic> _$GradeTypeToJson(GradeType instance) => <String, dynamic>{
      'memberGradeType': _$MemberGradeTypeEnumMap[instance.memberGradeType],
    };

const _$MemberGradeTypeEnumMap = {
  MemberGradeType.BASIC: 'BASIC',
  MemberGradeType.FRIEND: 'FRIEND',
  MemberGradeType.FAMILY: 'FAMILY',
  MemberGradeType.VIP: 'VIP',
  MemberGradeType.LVIP: 'LVIP',
};

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      offset: json['offset'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'sort': instance.sort,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      sorted: json['sorted'] as bool?,
      unsorted: json['unsorted'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
      'empty': instance.empty,
    };
