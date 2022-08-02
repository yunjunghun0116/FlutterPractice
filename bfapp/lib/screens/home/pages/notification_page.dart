import 'package:app/controllers/user_controller.dart';
import 'package:app/icon.dart';
import 'package:app/models/notification/notification_alarm.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';

import '../../../components/view/navigation_bar_view.dart';
import '../../../constants/constants_color.dart';
import '../../../enum/enum.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
        backgroundColor: kWhiteColor,
        type: NavigationType.back,
        title: '알림',
      ),
      body: FutureBuilder(
        future: UserController.to.user != null
            ? NetworkUtils().getNotificationList(UserController.to.user!.id)
            : null,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<NotificationAlarm> alarmList =
                snapshot.data as List<NotificationAlarm>;
          }
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset(
                            icLogoLine,
                            color: kLightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '알림 내역이 없습니다.',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLightGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
