import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/user_controller.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class FCMController extends GetxController {
  static FCMController get to => Get.find();
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
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
  void onInit() {
    super.onInit();
    notificationInitialize();
    firebaseInitialize();
    updateNotificationToken();
  }

  @override
  void dispose() {
    _notificationPlugin.cancelAll();
    super.dispose();
  }

  void updateNotificationToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await UserController.to.updateUser({'notificationToken': token});
    }
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
    _notificationPlugin.initialize(initializationSettings);
  }

  void firebaseInitialize() {
    //Firebase Initialize
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(
        title: message.data['title'],
        content: message.data['body'],
      );
    });
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message)async{
    });
  }

  void showNotification({
    required String title,
    required String content,
  }) async {
    await _notificationPlugin.show(
      0,
      title,
      content,
      detail,
    );
  }

  Future<void> sendFCM({
    required String token,
    required String title,
    required String message,
  }) async {
    if (token == '') return;
    http.Response data = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Authorization': 'key=$serverKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'direct_boot_ok': true,
        'to': token,
        'notification': {
          'title': title,
          'body': message,
        },
        'data': {
          'title': title,
          'body': message,
        },
      }),
    );
    print(data.body);
  }
}
