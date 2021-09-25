class FeedTime {
  String id;
  String previousTime;
  String futureTime;
  bool isFinished;

  FeedTime({
    required this.id,
    required this.previousTime,
    required this.futureTime,
    required this.isFinished
  });

  String get feedPreviousTime => this.previousTime;
  String get feedFutureTime => this.futureTime;
  bool get feedIsFinished => this.isFinished;
}
