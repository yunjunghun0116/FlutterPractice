
import 'package:app/enum/enum.dart';
import 'package:app/icon.dart';
import 'package:app/utils/local_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_list_model.g.dart';

@JsonSerializable()
class EventList {
  String status;
  String message;
  String redirect;
  EventData? data;

  EventList({
    required this.status,
    required this.message,
    required this.redirect,
    this.data,
  });

  factory EventList.fromJson(Map<String, dynamic> json) => _$EventListFromJson(json);
  Map<String, dynamic> toJson() => _$EventListToJson(this);
}

@JsonSerializable()
class EventData {

  List<EventContent>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  int? size;
  int? number;
  bool? empty;

  EventData({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.sort,
    this.numberOfElements,
    this.first,
    this.size,
    this.number,
    this.empty,
  });

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    content: List<EventContent>.from(json["content"].map((x) => EventContent.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    last: json["last"],
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    sort: Sort.fromJson(json["sort"]),
    numberOfElements: json["numberOfElements"],
    first: json["first"],
    size: json["size"],
    number: json["number"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content!.map((x) => x.toJson())),
    "pageable": pageable!.toJson(),
    "last": last,
    "totalPages": totalPages,
    "totalElements": totalElements,
    "sort": sort!.toJson(),
    "numberOfElements": numberOfElements,
    "first": first,
    "size": size,
    "number": number,
    "empty": empty,
  };
}

@JsonSerializable()
class EventContent {

  int id;
  dynamic storeInfo;
  int? startDate;
  int? endDate;
  String? imageBanner;
  String? mainImage;
  dynamic imageForm;
  String? title;
  String? contents;
  String? progressType;
  List<GradeType>? gradeTypes;
  String? eventStatus;
  String? regionTypes;
  String? eventType;
  String? homeBannerImage;
  bool? homeBannerActive;
  bool? deleted;
  bool? applyStatus;
  bool? isWholeStore;
  dynamic applyMemberCount;
  int? viewCount;
  List<dynamic>? detailImages;

  EventContent({
    required this.id,
    this.storeInfo,
    this.startDate,
    this.endDate,
    this.imageBanner,
    this.mainImage,
    this.imageForm,
    this.title,
    this.contents,
    this.progressType,
    this.gradeTypes,
    this.eventStatus,
    this.regionTypes,
    this.eventType,
    this.homeBannerImage,
    this.homeBannerActive,
    this.deleted,
    this.applyStatus,
    this.isWholeStore,
    this.applyMemberCount,
    this.viewCount,
    this.detailImages,
  });

  factory EventContent.fromJson(Map<String, dynamic> json) => EventContent(
    id: json["id"],
    storeInfo: json["storeInfo"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    imageBanner: json["imageBanner"],
    mainImage: json["mainImage"],
    imageForm: json["imageForm"],
    title: json["title"],
    contents: json["contents"],
    progressType: json["progressType"],
    gradeTypes: List<GradeType>.from(json["gradeTypes"].map((x) => GradeType.fromJson(x))),
    eventStatus: json["eventStatus"],
    regionTypes: json["regionTypes"],
    eventType: json["eventType"],
    homeBannerImage: json["homeBannerImage"],
    homeBannerActive: json["homeBannerActive"],
    deleted: json["deleted"],
    applyStatus: json["applyStatus"],
    isWholeStore: json["isWholeStore"],
    applyMemberCount: json["applyMemberCount"],
    viewCount: json["viewCount"],
    detailImages: List<dynamic>.from(json["detailImages"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "storeInfo": storeInfo,
    "startDate": startDate,
    "endDate": endDate,
    "imageBanner": imageBanner,
    "mainImage": mainImage,
    "imageForm": imageForm,
    "title": title,
    "contents": contents,
    "progressType": progressType,
    "gradeTypes": List<dynamic>.from(gradeTypes!.map((x) => x.toJson())),
    "eventStatus": eventStatus,
    "regionTypes": regionTypes,
    "eventType": eventType,
    "homeBannerImage": homeBannerImage,
    "homeBannerActive": homeBannerActive,
    "deleted": deleted,
    "applyStatus": applyStatus,
    "isWholeStore": isWholeStore,
    "applyMemberCount": applyMemberCount,
    "viewCount": viewCount,
    "detailImages": List<dynamic>.from(detailImages!.map((x) => x)),
  };

  String getTitle() {
    return title ?? "";
  }

  String getDate() {
    return getApplyDateTime(startDate ?? 0, endDate ?? 0);
  }

  String getViewCount() {
    return '조회수 : ${viewCount ?? 0}';
  }

  String getProgressType() {
    return progressType ?? '';
  }

  String getRegionType() {
    switch(regionTypes) {
      case "SEOUL":
        return "서울";
      case "GYEONGGI":
        return "경기";
      case "INCHEON":
        return "인천";
      case "GANGWON":
        return "강원";
      case "CHUNGCHEONG":
        return "충청";
      case "GYEONGSANG":
        return "경상";
      case "JEOLLA":
        return "전라";
      case "JEJU":
        return "제주";
      default:
        return "전국";
    }
  }
}

@JsonSerializable()
class GradeType {

  MemberGradeType? memberGradeType;

  GradeType({
    this.memberGradeType,
  });

  factory GradeType.fromJson(Map<String, dynamic> json) => GradeType(
    memberGradeType: memberGradeTypeValues[json["memberGradeType"]]
  );

  Map<String, dynamic> toJson() => {
    "memberGradeType": memberGradeTypeValues[memberGradeType]
  };

  String imageFromGradeType() {
    switch(memberGradeType) {
      case MemberGradeType.BASIC:
        return tagBasic;
      case MemberGradeType.FRIEND:
        return tagFriend;
      case MemberGradeType.FAMILY:
        return tagFamily;
      case MemberGradeType.VIP:
        return tagVip;
      case MemberGradeType.LVIP:
        return tagLVip;
      default:
        return '';
    }
  }
}

@JsonSerializable()
class Pageable {

  Sort? sort;
  int? pageNumber;
  int? pageSize;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable({
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    offset: json["offset"],
    paged: json["paged"],
    unpaged: json["unpaged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort!.toJson(),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "offset": offset,
    "paged": paged,
    "unpaged": unpaged,
  };
}

@JsonSerializable()
class Sort {

  bool? sorted;
  bool? unsorted;
  bool? empty;

  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    sorted: json["sorted"],
    unsorted: json["unsorted"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "sorted": sorted,
    "unsorted": unsorted,
    "empty": empty,
  };
}