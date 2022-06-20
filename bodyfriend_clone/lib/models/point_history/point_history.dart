import 'package:json_annotation/json_annotation.dart';
part 'point_history.g.dart';

@JsonSerializable()
class PointHistory {
  final int memberId;
  final String memberName;
  final int pointHistoryId;
  final int txDate;
  final int expirationDate;
  final String pointCategory;
  final String pointCategoryName;
  final int beforeBalance;
  final int txAmount;
  final int afterBalance;
  final int remainAmount;
  final String pointStatusType;
  final bool cancelStatus;
  final int resultPoint;

  PointHistory({
    required this.memberId,
    required this.memberName,
    required this.pointHistoryId,
    required this.txDate,
    required this.expirationDate,
    required this.pointCategory,
    required this.pointCategoryName,
    required this.beforeBalance,
    required this.txAmount,
    required this.afterBalance,
    required this.remainAmount,
    required this.pointStatusType,
    required this.cancelStatus,
    required this.resultPoint,
  });

  factory PointHistory.fromJson(json) => _$PointHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PointHistoryToJson(this);
}
