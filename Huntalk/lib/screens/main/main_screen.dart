import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/fcm_controller.dart';
import 'package:huntalk/screens/chat/chat_screen.dart';
import 'package:huntalk/screens/home/home_screen.dart';
import 'package:huntalk/screens/notification/notification_screen.dart';
import 'package:huntalk/screens/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentPageIndex = 0;

  Widget _getScreens() {
    switch (_currentPageIndex) {
      case 0:
        return HomeScreen(
          pageUpdateFunction: _pageChange,
        );
      case 1:
        return const ChatScreen();
      case 2:
        return const UserScreen();
      default:
        return const NotificationScreen();
    }
  }

  void _pageChange(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(FCMController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('Hun Talk'),
        elevation: 0,
      ),
      body: _getScreens(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _pageChange,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'notifications',
          ),
        ],
      ),
    );
  }
}
