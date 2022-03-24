import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:widgetpractice/constants.dart';

class KakaoMapScreen extends StatefulWidget {
  const KakaoMapScreen({Key? key}) : super(key: key);

  @override
  State<KakaoMapScreen> createState() => _KakaoMapScreenState();
}

class _KakaoMapScreenState extends State<KakaoMapScreen> {
  String url = 'https://map.kakao.com/link/map/37.402056,127.108212';
  Set<JavascriptChannel> channel = {};
  WebViewController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel.add(
      JavascriptChannel(
        name: 'setLevel',
        onMessageReceived: (JavascriptMessage message) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: const Text('카카오맵 웹뷰'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ClipRect(
              child: Transform.scale(
                scale: ratio,
                child: WebView(
                  initialUrl: url,
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  javascriptChannels: channel,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
