import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_market/components/manner_temp.dart';
import 'package:my_market/repository/contents_repository.dart';
import 'package:my_market/utils/stringprice.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView(this.data);
  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //device의 size -> width/height등을 알기위해서 사용
  Size? size;
  //HomeScreen에서 받아온 image를 imgList안에 집어넣기위함 -> CarouselSlider에서 사용하기위해서.
  List<String?> imgList = [];
  //현재 보고있는 이미지의 index를 알기 위한 값.
  int? _currentIndex = 0;
  //현재 내가보고있는 스크롤의 위치를 알기위한 컨트롤러 && 현재 스크롤의 위치(_controller.offset)을 알기위한 값.
  ScrollController _controller = ScrollController();
  double? _scrollPositionToAlpha = 0;
  //AnimationController이용
  AnimationController? _animationController;
  Animation? _colorTween;
  //내 관심상품인지 체크하기위한요소
  bool? _isMyLikeContent = false;
  //ContentsRepository에 접근하기위한요소.
  ContentsRepository? contentsRepository = ContentsRepository();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //mediaQuery를 이용해서 현재 디바이스의 사이즈를 가져온다.
    size = MediaQuery.of(context).size;
    imgList = [
      widget.data['image'],
      widget.data['image'],
      widget.data['image'],
      widget.data['image'],
      widget.data['image'],
    ];
    _controller.addListener(() {
      setState(() {
        _scrollPositionToAlpha =
            _controller.offset > 255 ? 255 : _controller.offset;
        _animationController!.value = _scrollPositionToAlpha!;
      });
    });
    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController!);
    _loadMyFavoriteContentState();
  }

  _loadMyFavoriteContentState() async {
    bool favorite =
        await contentsRepository!.isMyFavoriteContents(widget.data['cid']!);
    setState(() {
      _isMyLikeContent = favorite;
    });
    print(_isMyLikeContent);
  }

  Widget _makeIcon(IconData icon) {
    return AnimatedBuilder(
      animation: _colorTween!,
      builder: (context, child) {
        return Icon(
          icon,
          color: _colorTween!.value,
        );
      },
    );
  }

  AppBar _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.white.withAlpha(_scrollPositionToAlpha!.toInt()),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: _makeIcon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: _makeIcon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: _makeIcon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    //SingleChildScrollView를 통해 픽셀이 벗어나도 볼수있도록
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _makeSliderImage(),
              _sellerSimpleInfo(),
              _divideLine(),
              _contentDetail(),
              _divideLine(),
              _sellerOtherContent(),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          sliver: SliverGrid(
            delegate: SliverChildListDelegate(List.generate(10, (index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.grey,
                        height: 120.0,
                      ),
                    ),
                    Text(
                      '상품제목',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      '금액',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              );
            })),
            //인스타그램의 경우 crossAxisCount를 3으로 한것뿐 그외에는 다 동일
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      width: size!.width,
      height: 55,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (_isMyLikeContent!) {
                await contentsRepository!
                    .deleteMyFavoriteContent(widget.data['cid']!);
              } else {
                await contentsRepository!.addMyFavoriteContent(widget.data);
              }
              setState(() {
                _isMyLikeContent = !_isMyLikeContent!;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text(
                      _isMyLikeContent! ? '관심목록에 추가되었습니다.' : '관심목록에서 삭제되었습니다.'),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/svg/heart_${_isMyLikeContent! ? 'on' : 'off'}.svg',
              width: 30,
              color: Color(0xFFF08F4F),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: 1.0,
            height: 40.0,
            color: Colors.black.withOpacity(0.2),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                calcStringToWon(widget.data['price']!),
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '가격제안불가',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF08F4F),
                  ),
                  child: Text(
                    '채팅하러가기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeSliderImage() {
    return Stack(
      children: [
        Hero(
          tag: widget.data['cid']!,
          child: CarouselSlider(
            items: imgList.map((String? url) {
              return Image.asset(
                url!,
                width: size!.width,
                fit: BoxFit.fill,
              );
            }).toList(),
            options: CarouselOptions(
                height: size!.width,
                initialPage: 0,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
        ),
        //stack상에서 positioned를 통해 부모컨테이너 기준 어디에 위치할지를 정해준다.
        Positioned(
          //bottom 0을 통해 이미지위에 얹어주지만 이미지상 맨밑에 위치해주고,
          bottom: 0,
          //left:0,right:0을 동시에 주게되면 이미지갯수에 상관없이 가운데로 위치하게된다.
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //map의 형태로 나타냈을때 key,value의 값을 동시에 갖는다
            //밑의 경우 map((entry){})에서 entry는 key의 값을 갖는다.
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  //여기서 확인할수있듯이 entry.key는 결국 index와도 같은값을갖는다.
                  print(entry.key);
                },
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _divideLine() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Divider(
        height: 3.0,
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }

  Widget _sellerSimpleInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            //circleAvatar는 radius가 size와 같음.
            radius: 30,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '정훈',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              Text(
                widget.data['location']!,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12.0),
              )
            ],
          ),
          Expanded(
            child: MannerTemperature(36.5),
          ),
        ],
      ),
    );
  }

  Widget _contentDetail() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.data['title']!,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
          ),
          Text(
            //data에 type등을 저장하면 이용가능
            '제품 종류 / 2시간전',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 12.0,
                color: Colors.grey),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '선물받은 새상품이고 \n상품 꺼내보기만 했습니다\n거래는 직거래만합니다\n010-1234-5678',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15.0,
              color: Colors.grey,
              //줄간격
              height: 2.0,
            ),
          ),
          Text(
            '채팅 3 | 관심 17 | 조회 295',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 12.0,
              color: Colors.grey,
              //줄간격
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sellerOtherContent() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Column(
        children: [
          Text(
            '판매자의 다른 상품',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appbar에 해당하는 부분까지 침범하겠다는 의미
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
