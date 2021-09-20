class FeedTime {
  String id;
  String date;

  FeedTime({
    required this.id,
    required this.date,
  });
  String _nextDate() {
    return this.date + '다음';
  }

  String get momentDate => this.date;
  String get nextDate => _nextDate();
}
