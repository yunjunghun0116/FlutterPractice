import 'package:get/get.dart';
import 'package:mytube/src/models/video_statistics.dart';
import 'package:mytube/src/models/youtuber.dart';
import '../models/video.dart';
import '../repository/youtube_repository.dart';

class VideoController extends GetxController {
  Video? video;
  VideoController({this.video});
  Rx<VideoStatistics> statistics = VideoStatistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    VideoStatistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video!.id!.videoId);
    statistics(loadStatistics);
    Youtuber? loadYoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(video!.snippet!.channelId);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String? get viewCountString => '조회수 ${statistics.value.viewCount ?? '-'}회';

  String? get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return 'https://thumbs.dreamstime.com/z/user-icon-trendy-flat-style-isolated-grey-background-user-symbol-user-icon-trendy-flat-style-isolated-grey-background-123663211.jpg';
    return youtuber.value.snippet!.thumbnails!.medium!.url;
  }
}
