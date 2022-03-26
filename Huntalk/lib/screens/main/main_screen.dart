import 'package:flutter/material.dart';
import 'package:huntalk/screens/chat/chat_screen.dart';
import 'package:huntalk/screens/home/home_screen.dart';
import 'package:huntalk/screens/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  Widget _getScreens(){
    switch(_currentPageIndex){
      case 0:
        return const HomeScreen();
      case 1:
        return const ChatScreen();
      default:
        return const UserScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getScreens(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index){
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline),label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'User'),
        ],
      ),
    );
  }
}
