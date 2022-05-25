import 'dart:async';
import 'dart:convert';

import 'package:bodyfriend_clone/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _webViewController;//내가 나중에 사용할(Javascript작업할 webviewcontroller)

  final String newUrlString =
      'https://auth.bodyfriend.co.kr/auth/common/intro?client_id=membership';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          //args의 controller는 웹뷰가 다 만들어져서 이 웹뷰에 대한 권한을 모두 갖고있는 controller
          onWebViewCreated: (WebViewController controller) {
            _webViewController = controller;
            _controller.complete(controller);
          },
          javascriptChannels: {
            JavascriptChannel(
                name: 'setNative',
                onMessageReceived: (javascriptData) {
                  Map<String, dynamic> data = jsonDecode(javascriptData.message);
                  Get.back(result: data);
                }),
            JavascriptChannel(
                name: 'closePage',
                onMessageReceived: (message) {
                  Get.back();
                }),
            JavascriptChannel(
                name: 'getCurrentVersion',
                onMessageReceived: (message) async {
                  String? urlString = await _webViewController.currentUrl();
                  if (urlString != null && urlString.contains(newUrlString)) {
                    _webViewController.runJavascript('setCurrentVersion(true);');
                    print('true 호출');
                  } else {
                    _webViewController
                        .runJavascript('setCurrentVersion(false);');
                    print('false 호출');
                  }
                }),
          },
          initialUrl:
              'https://auth.bodyfriend.co.kr/auth/common/login?client_id=membership',
        ),
      ),
    );
  }
}
