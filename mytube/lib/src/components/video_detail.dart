import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controller/app_video_detail_controller.dart';

class VideoDetail extends GetView<YoutubeDetailController> {
  VideoDetail({Key? key}) : super(key: key);

  Widget _titleArea() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            controller.title,
            style: TextStyle(fontSize: 15.0),
          ),
          Row(
            children: [
              Text(
                '조회수 ${controller.viewCount}회',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Text('ㆍ'),
              Text(
                controller.publishedTime,
                // controller.publishedTime,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
          _buttonArea(),
        ],
      ),
    );
  }

  Widget _buttonArea() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buttonIcon(icon: 'like', label: controller.likeCount),
          _buttonIcon(icon: 'dislike', label: controller.dislikeCount),
          _buttonIcon(icon: 'share', label: '공유'),
          _buttonIcon(icon: 'save', label: '저장'),
        ],
      ),
    );
  }

  Widget _buttonIcon({required String icon, required String label}) {
    return Column(
      children: [
        SvgPicture.asset('assets/svg/icons/$icon.svg'),
        Text(label),
      ],
    );
  }

  Widget _descriptionArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        controller.description,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }

  Widget _ownerArea() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage:
                Image.network(controller.youtuberThumbnailUrl).image,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.youtuberName,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '구독자 ${controller.youtuberSubscriber}명',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              '구독',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divideLine() {
    return Container(
      height: 1.0,
      color: Colors.black.withOpacity(0.1),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleArea(),
          _divideLine(),
          _ownerArea(),
          _divideLine(),
          _descriptionArea(),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: controller.playerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              controller.playerController.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ],
        onEnded: (data) {
          controller.playerController
              .load(controller.playerController.initialVideoId);
        },
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Expanded(
              flex: 1,
              child: player,
            ),
            Expanded(
              flex: 2,
              child: _description(),
            ),
          ]),
        );
      },
    );
  }
}
