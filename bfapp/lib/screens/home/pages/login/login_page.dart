import 'dart:collection';
import 'dart:convert';

import 'package:app/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  double progress = 0.0;
  final String url =
      "https://auth.bodyfriend.co.kr/auth/common/login?client_id=membership";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              // key: webViewKey,
              initialUrlRequest: URLRequest(url: Uri.parse(url)),
              initialUserScripts: UnmodifiableListView<UserScript>([]),
              initialOptions: options,
              onWebViewCreated: (controller) {
                webViewController = controller;
                webViewController?.addJavaScriptHandler(
                    handlerName: 'setNative',
                    callback: (value) {
                      Map<String, dynamic> data = jsonDecode(value[0]);
                      Get.back(result: data);
                    });
                webViewController?.addJavaScriptHandler(
                    handlerName: 'closePage',
                    callback: (value) {
                      print('closePage');
                      print(value);
                      Get.back();
                    });
                webViewController?.addJavaScriptHandler(
                    handlerName: 'getCurrentVersion',
                    callback: (value) {
                      print('getCurrentVersion');
                      print(value);
                    });
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              // onConsoleMessage: (controller, consoleMessage) {
              //   print(consoleMessage);
              // },
            ),
            progress < 1.0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
