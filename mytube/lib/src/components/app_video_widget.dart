import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mytube/src/controller/app_video_controller.dart';
import '../models/video.dart';

class AppVideoWidget extends StatefulWidget {
  final Video? video;
  const AppVideoWidget({Key? key, this.video}) : super(key: key);

  @override
  _AppVideoWidgetState createState() => _AppVideoWidgetState();
}

class _AppVideoWidgetState extends State<AppVideoWidget> {
  VideoController? _videoController;

  @override
  void initState() {
    super.initState();
    //tag를 넣어줌으로써 각각의 비디오마다 서로 다른 비디오컨트롤러를 가질수 있게 된다.
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video!.id!.videoId);
  }

  Widget _thumbnail() {
    return Container(
      width: double.infinity,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        widget.video!.snippet!.thumbnails!.medium!.url ?? '',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _simpleDetailInfo(){
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0),
      child: Row(
        children: [
          Obx(() {
            return CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(
                      _videoController!.youtuberThumbnailUrl!)
                  .image,
            );
          }),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //영역을 할당해주기위해서.
                    Expanded(
                      child: Text(
                        //최대 두줄까지 들어갈수있도록하기위해서,
                        widget.video!.snippet!.title!,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      //한줄일때는 아니지만 두줄로넘어가게되면 두줄중 center에 해당하기때문에 윗줄에 위치해주기위해서
                      alignment: Alignment.topRight,
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '유튜버이름',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text('ㆍ'),
                    Obx(() {
                      return Text(
                        _videoController!.viewCountString!,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      );
                    }),
                    Text('ㆍ'),
                    Text(
                      DateFormat('yyyy-MM-dd')
                          .format(widget.video!.snippet!.publishedAt!),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
