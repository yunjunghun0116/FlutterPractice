import 'package:flutter/material.dart';
import 'package:huntalk/controllers/fcm_controller.dart';
import 'package:huntalk/screens/notification/components/notification_button.dart';

import '../../controllers/local_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationButton(
          title: 'Simple Notification',
          icon: Icons.notifications,
          onPressed: () {},
        ),
        NotificationButton(
          title: 'Scheduled Notification',
          icon: Icons.notifications_active,
          onPressed: () {
            FCMController.to
                .sendFCM(token: 'asd', title: '이것은 타이틀', message: '보내는 메세지');
          },
        ),
        NotificationButton(
          title: 'Clear UserData',
          icon: Icons.delete_forever,
          onPressed: () => LocalController.to.clearSharedPreferences(),
        ),
      ],
    );
  }
}
