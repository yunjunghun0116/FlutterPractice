import 'package:bodyfriend_clone/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class VIPClassInfoPage extends StatefulWidget {
  const VIPClassInfoPage({Key? key}) : super(key: key);

  @override
  State<VIPClassInfoPage> createState() => _VIPClassInfoPageState();
}

class _VIPClassInfoPageState extends State<VIPClassInfoPage> {

  @override
  Widget build(BuildContext context) {
    print('check');
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'VIP클래스란?',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SfPdfViewer.asset(
              'assets/memberships/img_friend_invite.pdf',
              canShowScrollHead: false,
              canShowScrollStatus: false,
              enableDoubleTapZooming: false,
              enableTextSelection: false,
              onDocumentLoaded: (value){
                print('LoadingFinish');
              },
            ),
          ),
        ],
      ),
    );
  }
}
