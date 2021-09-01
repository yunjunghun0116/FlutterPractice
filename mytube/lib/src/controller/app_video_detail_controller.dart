import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'app_video_controller.dart';

class YoutubeDetailController extends GetxController {
  VideoController? _videoController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoController = Get.find(tag: Get.parameters['videoId']);
    print(_videoController!.video!.toJson());
  }

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
      : 'https://yt3.ggpht.com/pR5GyqHb4jp_P7jRnawuoVczXBYCEtTTHyILKfmM_PRz9jjiLSXlxJqx3uSbuI9g69DUq-REFQ=s600-c-k-c0x00ffffff-no-rj-rp-mo';
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
    int minutes = seconds ~/ 60 ;
    if (minutes < 60) {
      return '$minutes시간 전';
    }
    int days = minutes ~/ 24 ;
    if (days < 7) {
      return '$days일 전 ';
    }
    int weeks = days ~/ 7 ;
    if (weeks < 5) {
      return '$weeks주 전';
    }
    int months = days ~/ 30 ;
    if (months < 12) {
      return '$months개월 전';
    }
    int years = days ~/ 365;
    return '$years년 전';
  }
}
