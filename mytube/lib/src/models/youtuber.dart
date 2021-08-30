import 'package:mytube/src/models/video.dart';
import 'package:mytube/src/models/video_statistics.dart';

class Youtuber {
  Youtuber({this.snippet, this.statistics});

  Snippet? snippet;
  VideoStatistics? statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: Snippet.fromJson(json['snippet']),
        statistics: VideoStatistics.fromJson(json['statistics']),
      );
}
