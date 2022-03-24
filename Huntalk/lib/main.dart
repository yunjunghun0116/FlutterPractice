import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/screens/chat/chat_screen.dart';
import 'package:huntalk/screens/home/home_screen.dart';
import 'package:huntalk/screens/main/main_screen.dart';
import 'package:huntalk/screens/start/start_screen.dart';
import 'package:huntalk/screens/user/user_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hun Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/start',
      getPages: [
        GetPage(name: '/start', page: ()=>const StartScreen()),
        GetPage(name: '/main', page: ()=>const MainScreen()),
        GetPage(name: '/home', page: ()=>const HomeScreen()),
        GetPage(name: '/chat', page: ()=>const ChatScreen()),
        GetPage(name: '/user', page: ()=>const UserScreen()),
      ],
    );
  }
}