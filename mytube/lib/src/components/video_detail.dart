import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key}) : super(key: key);

  Widget _titleArea() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '여기에는 영상 제목이 들어감',
            style: TextStyle(fontSize: 15.0),
          ),
          Row(
            children: [
              Text(
                '조회수 1000회',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Text('ㆍ'),
              Text(
                '2021-08-30',
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
          _buttonIcon(icon: 'like', label: '1000'),
          _buttonIcon(icon: 'dislike', label: '1'),
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
        "여기에는 영상에 대한 설명이 들어옴",
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
            backgroundImage: Image.network(
                    'https://yt3.ggpht.com/pR5GyqHb4jp_P7jRnawuoVczXBYCEtTTHyILKfmM_PRz9jjiLSXlxJqx3uSbuI9g69DUq-REFQ=s600-c-k-c0x00ffffff-no-rj-rp-mo')
                .image,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '정훈',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '구독자 10000명',
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.5),
            height: 250,
          ),
          Expanded(
            child: _description(),
          ),
        ],
      ),
    );
  }
}
