import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  late WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: const Text('이용 가이드'),
        centerTitle: true,
        elevation: 1,
      ),
      body: UserController.to.user != null
          ? FutureBuilder(
              future: NetworkUtils().getUserGuide(
                UserController.to.user!.id,
                UserController.to.user!.accessToken,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String imageUrl = snapshot.data as String;
                  return ListView(
                    children: [
                      Image.network(imageUrl),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 5.4,
                        child: WebView(
                          initialUrl:
                              'http://d.bodyfriend.co.kr/event/detail?id=72&width=${MediaQuery.of(context).size.width.toInt()}',
                          onWebViewCreated: (controller) {
                            webViewController = controller;
                          },
                          gestureNavigationEnabled: true,
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            )
          : Container(),
    );
  }
}
