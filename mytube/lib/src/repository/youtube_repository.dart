import 'package:get/get.dart';
import 'package:mytube/src/models/youtube_video_result.dart';

//http를 감싸는 getconnect
class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos() async {
    String url =
        '/youtube/v3/search?part=snippet&channelId=UCPBHGt7lq3I42IGuSoXYGPg&maxResults=10&order=date&type=video&viderDefinition=high&key=AIzaSyBtsuAUYgK1RAxTLGG5D8qBp0DsStyoR0A';
    final res = await get(url);
    if (res.status.hasError) {
      return Future.error(res.statusText!);
    } else {
      if (res.body['items'] != null && res.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(res.body);
      }
    }
  }
}
