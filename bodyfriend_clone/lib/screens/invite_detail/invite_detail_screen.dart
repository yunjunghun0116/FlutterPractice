import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/screens/invite_detail/pages/invite_reward_page.dart';
import 'package:bodyfriend_clone/screens/invite_detail/pages/invite_send_page.dart';
import 'package:flutter/material.dart';

class InviteDetailScreen extends StatefulWidget {
  const InviteDetailScreen({Key? key}) : super(key: key);

  @override
  State<InviteDetailScreen> createState() => _InviteDetailScreenState();
}

class _InviteDetailScreenState extends State<InviteDetailScreen> {
  int _currentIndex = 0;

  Widget _getScreen(){
    switch(_currentIndex){
      case 0:
        return const InviteRewardPage();
      case 1:
      default:
        return const InviteSendPage();
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
        title: const Text('초대현황'),
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
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kMainColor.withOpacity(0.6),kMainColor.withOpacity(0.9)],
                )
              ),
              child: const Text('초대하기',style: TextStyle(
                color: kWhiteColor,
              ),),

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
      onTap: ()=>onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border(
            bottom: BorderSide(
              color: currentIndex==tabIndex?kMainColor:kGreyColor,
              width: 2,
            )
          )
        ),
        child: Text(title,style: TextStyle(
          color: currentIndex==tabIndex?kMainColor:kGreyColor,
        ),),
      ),
    ),
  );
}
