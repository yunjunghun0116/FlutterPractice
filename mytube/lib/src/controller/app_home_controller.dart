import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytube/src/models/youtube_video_result.dart';
import 'package:mytube/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult?> youtubeResults = YoutubeVideoResult(items: []).obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    _videoLoad();
    _scrollControllerEvent();
    super.onInit();
  }

  void _scrollControllerEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResults.value!.nextPageToken != '') {
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadVideos(youtubeResults.value!.nextPageToken ?? '');
    if (youtubeVideoResult!.items!.length > 0) {
      youtubeResults.update((prevYoutubeResults) {
        prevYoutubeResults!.nextPageToken = youtubeVideoResult.nextPageToken;
        prevYoutubeResults.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }
}
