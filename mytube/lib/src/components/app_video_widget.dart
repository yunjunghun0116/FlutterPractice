import 'package:flutter/material.dart';
import '../models/video.dart';

class AppVideoWidget extends StatelessWidget {
  final Video? video;
  const AppVideoWidget({Key? key, this.video}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      width: double.infinity,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        video!.snippet!.thumbnails!.medium!.url ?? '',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //영역을 할당해주기위해서.
                    Expanded(
                      child: Text(
                        //최대 두줄까지 들어갈수있도록하기위해서,
                        video!.snippet!.title!,
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
                    Text(
                      '조회수 1000회',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Text('ㆍ'),
                    Text(
                      '2021-02-13',
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
