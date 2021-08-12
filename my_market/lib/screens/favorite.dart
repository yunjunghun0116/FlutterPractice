import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_market/repository/contents_repository.dart';
import 'package:my_market/utils/stringprice.dart';

import 'detail.dart';

class FavoriteContentsView extends StatefulWidget {
  @override
  _FavoriteContentsViewState createState() => _FavoriteContentsViewState();
}

class _FavoriteContentsViewState extends State<FavoriteContentsView> {
  ContentsRepository _contentsRepository = ContentsRepository();
  AppBar _appbarWidget() {
    return AppBar(
      title: Text(
        '관심목록',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  Future<List<dynamic>?>_loadMyFavoriteContents() async{
    return await _contentsRepository.loadFavoriteContents();
  }

  Widget _makeDataList(List<dynamic> favoriteContents) {
    List items = favoriteContents;
    return ListView.separated(
      //itemBuilder에 있는 padding에서 넣지 않는 이유는
      //밑에 seperaterBuilder를 이용한 구분선에도 padding을 넣어주기위함이다
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailContentView(items[index]);
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  //가져온 이미지의 border를 둥글게 만들어주는 위젯
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    child: Hero(
                      tag: items[index]['cid'],
                      child: Image.asset(
                        items[index]['image']!,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 15.0),
                      height: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]['title']!,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            items[index]['location']!,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            calcStringToWon(items[index]['price']!),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/heart_off.svg',
                                  width: 12.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  items[index]['likes']!.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 2.0,
            color: Colors.black.withOpacity(0.4),
          );
        },
        itemCount: items.length);
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadMyFavoriteContents(),
      builder: (context, snapshot) {
        //로딩처리해주기
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('해당 지역의 제품이 없습니다.'),
          );
        }
        if (snapshot.hasData) {
          List<dynamic>? favoriteContents = snapshot.data as List?;
          return _makeDataList(favoriteContents!);
        }
        return Center(
          child: Text('데이터가 없습니다.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
