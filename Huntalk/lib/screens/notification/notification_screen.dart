import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:huntalk/screens/notification/components/notification_button.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../utils/chat_utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String value = '';

  String token = '';
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationDetails detail = const NotificationDetails(
    android: AndroidNotificationDetails(
      'channel Id',
      'channel Name',
      channelDescription: 'channel description',
      icon: '@mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
      importance: Importance.max,
      priority: Priority.max,
    ),
    iOS: IOSNotificationDetails(),
  );

  @override
  void initState() {
    super.initState();
    setToken();
    notificationInitialize();
  }

  void setToken()async{
    String? s = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = s??'';
    });
  }

  @override
  void dispose() {
    _flutterLocalNotificationsPlugin.cancelAll();
    super.dispose();
  }

  void notificationInitialize() {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
    IOSInitializationSettings initializationSettingsIOS =
        const IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    //Firebase Initialize
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data['body']);
      if(mounted){
        setState(() {
          value = message.data['body'];
        });
      }

    });
  }

  //await _flutterLocalNotificationPlugin.~ 에서 payload부분은 모두 설정하여 주지 않아도 됩니다.
  //버튼을 눌렀을때 한번 알림이 뜨게 해주는 방법입니다.
  void _showNotification(
      {required String title, required String content}) async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      content,
      detail,
    );
  }

//반복적으로 알림을 뜨게 히는 방법입니다.
  Future _repeatNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        'huntalk_id', 'huntalk_channel',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.max);

    IOSNotificationDetails ios = const IOSNotificationDetails();
    NotificationDetails detail =
        NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      '반복 Notification',
      '반복 Notification 내용',
      //ReapeatInterval.{EveryMinute, Hourly, Daily, Weekly} 중 선택하여 사용할수 있습니다.
      RepeatInterval.everyMinute,
      detail,
      payload: 'Hello Flutter',
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationButton(
          title: 'Simple Notification',
          icon: Icons.notifications,
          onPressed: () {
            _showNotification(title: '타이틀', content: '내용');
          },
        ),
        NotificationButton(
          title: 'Scheduled Notification',
          icon: Icons.notifications_active,
          onPressed: () {
            ChatUtils().sendFCM(token: token);
          },
        ),
        NotificationButton(
          title: 'Remove Notifications',
          icon: Icons.delete_forever,
          onPressed: () {
            _repeatNotification();
          },
        ),
        Text(value),
      ],
    );
  }
}
