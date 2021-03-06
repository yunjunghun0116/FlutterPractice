import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/enum/enum.dart';
import 'package:app/icon.dart';
import 'package:app/screens/home/components/carousel_area.dart';
import 'package:app/screens/home/components/custom_icon_area.dart';
import 'package:app/screens/home/components/mall_container.dart';
import 'package:app/screens/home/components/top_login_button.dart';
import 'package:app/screens/home/pages/guide_screen_page.dart';
import 'package:app/screens/home/pages/notification_page.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'components/top_user_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: NavigationBarView(
          backgroundColor: kSubBlackColor,
          type: NavigationType.main,
          buttonTypes: const [
            NavigationButtonType.notification,
            NavigationButtonType.guide
          ],
        onPressed: (type){
            if(type == NavigationButtonType.notification){
              Get.to(()=>const NotificationPage());
            }
        },
      ),
      body: GetBuilder<UserController>(
        builder: (controller) {
          return ListView(children: [
            controller.user != null
                ? const TopUserButton()
                : const TopLoginButton(),
            const CustomIconArea(),
            const CarouselArea(),
            FutureBuilder(
              future: controller.user != null
                  ? NetworkUtils().getMemberMainList(
                      controller.user!.id)
                  : NetworkUtils().getMainList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //???????????? ????????? ????????????, ????????? ???????????????, ????????? ?????? ????????????
                if (snapshot.hasData) {
                  List mainList = snapshot.data;
                  return Column(
                    children: mainList.map((mainItem) {
                      if (mainItem['goodsList'].isEmpty) {
                        return Container();
                      }
                      return MallContainer(
                        goodsList: mainItem['goodsList'],
                        title: mainItem['title'],
                        description: mainItem['description'],
                      );
                    }).toList(),
                  );
                }
                return Container();
              },
            )
          ]);
        },
      ),
      floatingActionButton: SpeedDial(
        activeIcon: Icons.clear,
        icon: Icons.add,
        backgroundColor: kMainColor,
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            onTap: () {},
            child: const Text(
              '??????\n??????',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
          SpeedDialChild(
            child: const Text(
              '??????\n??????',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
          SpeedDialChild(
            child: const Text(
              '??????\n??????',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
          SpeedDialChild(
            child: const Text(
              'A/S\n??????',
              style: TextStyle(color: kWhiteColor),
            ),
            backgroundColor: kMainColor,
          ),
        ],
      ),
    );
  }
}
