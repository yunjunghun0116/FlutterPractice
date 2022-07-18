import 'package:json_annotation/json_annotation.dart';

part 'invite_history_model.g.dart';

@JsonSerializable()
class InviteHistory {
  final List content;
  final Map pageable;
  final bool first;
  final bool last;
  final int totalPages;
  final int totalElements;
  final Map sort;
  final int numberOfElements;
  final int size;
  final int number;
  final bool empty;

  InviteHistory({
    required this.content,
    required this.pageable,
    required this.first,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.sort,
    required this.numberOfElements,
    required this.size,
    required this.number,
    required this.empty,
  });

  factory InviteHistory.fromJson(Map<String, dynamic> json) =>
      _$InviteHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$InviteHistoryToJson(this);
}
