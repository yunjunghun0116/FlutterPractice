import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:app/constants/constants_color.dart';
import 'package:app/constants/constants_url.dart';
import 'package:app/controllers/local_controller.dart';
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
  // 주소 변경 필요
  final String url = '$loginUrl/auth/common/login?client_id=membership';

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
                    callback: (value) async {
                      Map<String, dynamic> data = jsonDecode(value[0]);
                      data['autoLogin'] = true;
                      await LocalController().setUserData(data);
                      log('data : $data');
                      Get.back(result: data);
                    });
                webViewController?.addJavaScriptHandler(
                    handlerName: 'closePage',
                    callback: (value) {
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
            ),
            progress < 1.0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
