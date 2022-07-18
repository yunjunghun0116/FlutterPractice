import 'dart:async';
import 'dart:convert';

import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: const Text('이용 가이드'),
        elevation: 1,
      ),
      body: FutureBuilder(
        future: NetworkUtils().getUseGuide(
            UserController.to.user!.id, UserController.to.user!.accessToken),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return SizedBox(
              width: double.infinity,
              child: WebView(
                onWebViewCreated: (WebViewController controller) {
                  _webViewController = controller;
                  _webViewController.loadUrl(
                    Uri.dataFromString(
                      snapshot.data as String,
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'),
                    ).toString(),
                  );
                },
                gestureNavigationEnabled: true,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
