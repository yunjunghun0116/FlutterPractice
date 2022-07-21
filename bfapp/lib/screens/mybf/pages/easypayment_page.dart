import 'package:app/components/view/navigation_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../shopping/components/custom_decoration.dart';

class EasyPaymentPage extends StatefulWidget {
  const EasyPaymentPage({Key? key}) : super(key: key);

  @override
  _EasyPaymentPageState createState() => _EasyPaymentPageState();
}

class _EasyPaymentPageState extends State<EasyPaymentPage> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  contentPadding: EdgeInsets.only(top: 0),
                  content: Container(
                    height: 200,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '★주의★',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '간편결제카드는 앱 내에서 간편하게\n'
                                  '결제하기 위한 편의 메뉴 입니다.\n'
                                  '자동이체 카드 등록은 메인화면\n'
                                  '"사용중인제품">"결제정보">"방식변경"\n'
                                  '에서 변경 가능하니 참고하시기 바랍니다.',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 1,
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('확인'))),
                      ],
                    ),
                  ),
                );
              }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: NavigationBarView(
          title: '간편카드 결제'
      ),
      body: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                    height: 56,
                    decoration: customDecoration.gradientGoldDecoration(),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        '등록하기',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
              ),
            ],
          )),
    ));
  }
}
