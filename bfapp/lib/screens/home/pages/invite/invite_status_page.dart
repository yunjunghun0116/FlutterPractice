import 'package:app/constants/constants_color.dart';
import 'package:app/screens/home/pages/invite/invite_reward_page.dart';
import 'package:app/screens/home/pages/invite/invite_sent_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 초대현황 페이지
class InviteStatusPage extends StatefulWidget {
  const InviteStatusPage({Key? key}) : super(key: key);

  @override
  State<InviteStatusPage> createState() => _InviteStatusPageState();
}

class _InviteStatusPageState extends State<InviteStatusPage> {
  int _currentIndex = 0;

  Widget _getScreen() {
    switch (_currentIndex) {
      case 0:
        return const InviteRewardPage();
      case 1:
      default:
        return const InviteSentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text(
          '초대현황',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  kTabButton(
                    currentIndex: _currentIndex,
                    tabIndex: 0,
                    title: '초대 리워드',
                    onPressed: () => setState(() {
                      _currentIndex = 0;
                    }),
                  ),
                  kTabButton(
                    currentIndex: _currentIndex,
                    tabIndex: 1,
                    title: '보낸 초대',
                    onPressed: () => setState(() {
                      _currentIndex = 1;
                    }),
                  ),
                ],
              ),
            ),
            Expanded(child: _getScreen()),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    kMainColor.withOpacity(0.6),
                    kMainColor.withOpacity(0.9)
                  ],
                )),
                child: const Text(
                  '초대하기',
                  style: TextStyle(
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget kTabButton({
  required int currentIndex,
  required int tabIndex,
  required String title,
  required Function onPressed,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kWhiteColor,
            border: Border(
                bottom: BorderSide(
              color: currentIndex == tabIndex ? kMainColor : kGreyColor,
              width: 2,
            ))),
        child: Text(
          title,
          style: TextStyle(
            color: currentIndex == tabIndex ? kMainColor : kGreyColor,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}
