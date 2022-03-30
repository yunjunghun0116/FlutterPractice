import 'package:flutter/material.dart';
import 'package:huntalk/screens/notification/components/notification_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          onPressed: () {},
        ),
        NotificationButton(
          title: 'Remove Notifications',
          icon: Icons.delete_forever,
          onPressed: () {},
        ),
      ],
    );
  }
}
