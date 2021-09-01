import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'app_video_controller.dart';

class YoutubeDetailController extends GetxController {
  VideoController? _videoController;
  YoutubePlayerController? _playerController;

  @override
  void onInit() {
    _videoController = Get.find(tag: Get.parameters['videoId']);
    _playerController = YoutubePlayerController(
      initialVideoId: Get.parameters['videoId']!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.onInit();
  }

  YoutubePlayerController get playerController => _playerController!;

  //VideoController에 무엇이있는지를 알아야함
  String get title => _videoController!.video!.snippet!.title!;
  String get description => _videoController!.video!.snippet!.description!;
  String get viewCount => _videoController!.statistics.value.viewCount!;

  String get likeCount => _videoController!.statistics.value.likeCount!;
  String get dislikeCount => _videoController!.statistics.value.dislikeCount!;
  String get publishedTime {
    int timeDifference = DateTime.now()
        .difference(_videoController!.video!.snippet!.publishTime!)
        .inSeconds;
    return getTimeDifference(timeDifference);
  }

  String get youtuberThumbnailUrl => _videoController!.youtuberThumbnailUrl !=
          null
      ? _videoController!.youtuberThumbnailUrl!
      : 'https://thumbs.dreamstime.com/z/user-icon-trendy-flat-style-isolated-grey-background-user-symbol-user-icon-trendy-flat-style-isolated-grey-background-123663211.jpg';
  String get youtuberName => _videoController!.youtuber.value.snippet!.title!;
  String get youtuberSubscriber =>
      _videoController!.youtuber.value.statistics!.subscriberCount!;

  String getTimeDifference(int input) {
    //다트언어에서 ~/문법은 나누었을때 몫을 나타내는 방법이다
    int differenceTime = input;
    if (differenceTime < 60) {
      return '방금전';
    }
    int seconds = differenceTime ~/ 60;
    if (seconds < 60) {
      return '$seconds분 전';
    }
    int minutes = seconds ~/ 60;
    if (minutes < 60) {
      return '$minutes시간 전';
    }
    int days = minutes ~/ 24;
    if (days < 7) {
      return '$days일 전 ';
    }
    int weeks = days ~/ 7;
    if (weeks < 5) {
      return '$weeks주 전';
    }
    int months = days ~/ 30;
    if (months < 12) {
      return '$months개월 전';
    }
    int years = days ~/ 365;
    return '$years년 전';
  }
}
