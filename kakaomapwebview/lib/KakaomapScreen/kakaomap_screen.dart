import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaokScreen extends StatefulWidget {
  final double lat;
  final double lng;
  KakaokScreen({Key? key, required this.lat, required this.lng})
      : super(key: key);

  @override
  State<KakaokScreen> createState() => _KakaokScreenState();
}

class _KakaokScreenState extends State<KakaokScreen> {
  double? mylat;
  double? mylng;
  WebViewController? _controller;
  List? location;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      mylat = widget.lat;
      mylng = widget.lng;
      location = [
        [mylat, mylng],
        // [mylat!+0.0003,mylng!+0.0003],
        // [mylat!+0.0006,mylng!+0.0006],
        // [mylat!+0.0009,mylng!+0.0009],
      ];
      List myLocation = [mylat, mylng];
      for (int i = 1; i < 100; i++) {
        location!.add([myLocation[0] + 0.0003 * i, myLocation[1] + 0.0003 * i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List kname = [
      '하하',
      '정훈',
      '하하',
      '정훈',
    ];

    return Column(children: [
      KakaoMapView(
        mapController: (WebViewController controller) {
          _controller = controller;
        },
        width: MediaQuery.of(context).size.width,
        height: 400,
        kakaoMapKey: '56a4f8826b4fb5b1d1a252d56ee87503',
        lat: mylat!,
        lng: mylng!,
        showMapTypeControl: true,
        showZoomControl: true,
        draggableMarker: true,
        mapType: MapType.BICYCLE,
        markerImageURL:
            'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
        onTapMarker: (message) {
          String? getLocations = message.message;
          List<String> ls = getLocations.split(',');
          print(ls);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
        cameraIdle: (message) {
          print('check');
          KakaoMapUtil util = KakaoMapUtil();
          KakaoLatLng latlng = util.getLatLng(message.message);
          debugPrint('current lat lng : ${latlng.lat}, ${latlng.lng}');
        },
        customScript: '''
    var markers = [];
    function getCameraCenter(){
                var center = map.getCenter(); 
                let cenlat = center.getLat();
                let cenlng = center.getLng();
                let returnString = cenlat+','+cenlng;
                return returnString;
              }

    function addMarker(position) {

      var marker = new kakao.maps.Marker({position: position});

      marker.setMap(map);

      markers.push(marker);
    }
    for(var i = 0 ; i < ${location!.length} ; i++){

      let lat = $location[i][0];
      let lng = $location[i][1];
      addMarker(new kakao.maps.LatLng(lat,lng));
      kakao.maps.event.addListener(markers[i], 'click', function(){
        let outputString = lat + ',' + lng;
        onTapMarker.postMessage(outputString);
     });
    }

		  var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
              ''',
      ),
      ElevatedButton(
          onPressed: () async {
            setState(() {
              if (mylat != null) {
                mylat != mylat! + 0.0031;
              }
              if (mylng != null) {
                mylng != mylng! + 0.0031;
              }
            });
            await _controller!.runJavascript('''
              var moveLatLng = new kakao.maps.LatLng(${mylat! - 0.003},${mylng! - 0.003});
              map.panTo(moveLatLng);
              ''');
          },
          child: Text('이동')),
      ElevatedButton(
        onPressed: () async {
          //현재 화면의 가운데 위치값을받아올수있음
          //그러면 스택으로 처리해준후에, return이 목적지인지 내위치인지 알아낸후에
          //그에대한 값을 처리해주면 되겠다!
          await _controller!.runJavascript('''
              onTapMarker.postMessage(getCameraCenter());
              ''');
        },
        child: Text('센터위치'),
      ),
      ElevatedButton(
        onPressed: () {
          if (_controller != null) {
            _controller!.runJavascript(
                'map.setLevel(map.getLevel() - 1, {animate: true})');
          }
        },
        child: Text('줌인'),
      ),
      ElevatedButton(
        onPressed: () {
          if (_controller != null) {
            _controller!.runJavascript(
                'map.setLevel(map.getLevel() + 1, {animate: true})');
          }
        },
        child: Text('줌아웃'),
      ),
    ]);
  }

  Future<void> _openKakaoMapScreen(BuildContext context) async {
    KakaoMapUtil util = KakaoMapUtil();

    // String url = await util.getResolvedLink(
    //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));

    /// This is short form of the above comment
    String url =
        await util.getMapScreenURL(37.402056, 127.108212, name: 'Kakao 본사');

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  }
}
