import 'package:get/get.dart';
import 'package:mytube/src/models/video_statistics.dart';
import 'package:mytube/src/models/youtube_video_result.dart';
import 'package:mytube/src/models/youtuber.dart';

final apiKey = 'AIzaSyBtsuAUYgK1RAxTLGG5D8qBp0DsStyoR0A';

//http를 감싸는 getconnect
class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos(String? nextPageToken) async {
    String url =
        '/youtube/v3/search?key=$apiKey&part=snippet&channelId=UCPBHGt7lq3I42IGuSoXYGPg&maxResults=10&order=date&type=video&viderDefinition=high&pageToken=$nextPageToken';
    final res = await get(url);
    if (res.status.hasError) {
      return Future.error(res.statusText!);
    } else {
      if (res.body['items'] != null && res.body['items'].length > 0) {
        print(res.body.toString());
        return YoutubeVideoResult.fromJson(res.body);
      }
    }
  }

  Future<VideoStatistics?> getVideoInfoById(String? videoId) async {
    String url = '/youtube/v3/videos?key=$apiKey&part=statistics&id=$videoId';
    final res = await get(url);
    if (res.status.hasError) {
      return Future.error(res.statusText!);
    } else {
      if (res.body['items']!.length > 0) {
        Map<String, dynamic> statistics = res.body['items'][0]['statistics'];
        print(statistics);
        return VideoStatistics.fromJson(statistics);
      }
    }
  }

  Future<Youtuber?> getYoutuberInfoById(String? channelId) async {
    String url =
        '/youtube/v3/channels?key=$apiKey&part=statistics,snippet&id=$channelId';
    final res = await get(url);
    if (res.status.hasError) {
      return Future.error(res.statusText!);
    } else {
      Map<String, dynamic>? youtuber = res.body['items'][0];
      print(youtuber);
      return Youtuber.fromJson(youtuber!);
    }
  }
}
