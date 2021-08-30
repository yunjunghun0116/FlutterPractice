import 'package:get/get.dart';
import 'package:mytube/src/models/youtube_video_result.dart';
import 'package:mytube/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult?> youtubeResults = YoutubeVideoResult().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult =
        await YoutubeRepository.to.loadVideos();
    if (youtubeVideoResult!.items!.length > 0) {
      youtubeResults(youtubeVideoResult);
    }
  }
}
