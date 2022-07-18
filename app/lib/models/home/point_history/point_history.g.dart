// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointHistory _$PointHistoryFromJson(Map<String, dynamic> json) {
  return PointHistory(
    memberId: json['memberId'] as int,
    memberName: json['memberName'] as String,
    pointHistoryId: json['pointHistoryId'] as int,
    txDate: json['txDate'] as int,
    expirationDate: json['expirationDate'] as int,
    pointCategory: json['pointCategory'] as String,
    pointCategoryName: json['pointCategoryName'] as String,
    beforeBalance: json['beforeBalance'] as int,
    txAmount: json['txAmount'] as int,
    afterBalance: json['afterBalance'] as int,
    remainAmount: json['remainAmount'] as int,
    pointStatusType: json['pointStatusType'] as String,
    cancelStatus: json['cancelStatus'] as bool,
    resultPoint: json['resultPoint'] as int,
  );
}

Map<String, dynamic> _$PointHistoryToJson(PointHistory instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'memberName': instance.memberName,
      'pointHistoryId': instance.pointHistoryId,
      'txDate': instance.txDate,
      'expirationDate': instance.expirationDate,
      'pointCategory': instance.pointCategory,
      'pointCategoryName': instance.pointCategoryName,
      'beforeBalance': instance.beforeBalance,
      'txAmount': instance.txAmount,
      'afterBalance': instance.afterBalance,
      'remainAmount': instance.remainAmount,
      'pointStatusType': instance.pointStatusType,
      'cancelStatus': instance.cancelStatus,
      'resultPoint': instance.resultPoint,
    };
