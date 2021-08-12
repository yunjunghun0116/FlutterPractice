import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_market/repository/contents_repository.dart';
import 'package:my_market/screens/detail.dart';
import '../utils/stringprice.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _currentLocationValue = 'ara';
  ContentsRepository _contentsRepository = ContentsRepository();
  final Map<String, String> _locationTypeToString = {
    'ara': '아라동',
    'ora': '오라동',
    'hansol': '한솔동'
  };
  @override
  void initState() {
    super.initState();
  }

  AppBar _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('Clicked');
        },
        child: PopupMenuButton<String>(
          //선택했을때 얼마나 내려가는지
          offset: Offset(0, 30.0),
          shape: ShapeBorder.lerp(
              //팝업메뉴의 경계선을 어떻게 할것인지 -> 둥글게 설정
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              1),
          //Type이 String이니까 value,onSelected인자 등을 String으로 받는다.
          onSelected: (String location) {
            setState(() {
              _currentLocationValue = location;
            });
          },
          //팝업메뉴의 아이템을 어떻게 생성할것인지
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('아라동'),
                value: 'ara',
              ),
              PopupMenuItem(
                child: Text('오라동'),
                value: 'ora',
              ),
              PopupMenuItem(
                child: Text('한솔동'),
                value: 'hansol',
              ),
            ];
          },
          child: Row(
            children: [
              Text(_locationTypeToString[_currentLocationValue]!),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      elevation: 10.0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/svg/bell.svg",
            width: 22.0,
          ),
        ),
      ],
    );
  }

  _loadContents() {
    return _contentsRepository.loadContentsFromLocation(_currentLocationValue!);
  }

  Widget _makeDataList(snapshot) {
    List? items = snapshot.data as List?;
    return ListView.separated(
        //itemBuilder에 있는 padding에서 넣지 않는 이유는
        //밑에 seperaterBuilder를 이용한 구분선에도 padding을 넣어주기위함이다
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailContentView(items![index]);
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
                      tag: items![index]['cid'],
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
        itemCount: items!.length);
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadContents(),
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
          return _makeDataList(snapshot);
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
