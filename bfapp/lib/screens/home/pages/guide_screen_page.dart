import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_url.dart';
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
      appBar: NavigationBarView(title: '이용 가이드'),
      body: FutureBuilder(
        future: NetworkUtils().getUserGuide(UserController.to.user!.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String imageUrl = snapshot.data as String;
            return ListView(
              children: [
                Image.network(imageUrl),
                SizedBox(
                  width: double.infinity,
                  //todo: 높이값 수정
                  height: 2000,
                  child: WebView(
                    initialUrl:
                        '${detailWebUrl}id=72&width=${MediaQuery.of(context).size.width.toInt()}',
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
      ),
    );
  }
}
