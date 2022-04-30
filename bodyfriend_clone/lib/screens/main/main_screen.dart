import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/screens/connect/connect_screen.dart';
import 'package:bodyfriend_clone/screens/event/event_screen.dart';
import 'package:bodyfriend_clone/screens/home/home_screen.dart';
import 'package:bodyfriend_clone/screens/shopping/shopping_screen.dart';
import 'package:bodyfriend_clone/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            EventScreen(),
            ShoppingScreen(),
            ConnectScreen(),
            UserScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMainColor,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 0?Icons.home:Icons.home_outlined,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 1?Icons.event:Icons.event_outlined,
            ),
            label: '이벤트',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 2?Icons.shopping_bag:Icons.shopping_bag_outlined,
            ),
            label: '쇼핑',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 3?Icons.person:Icons.person_outline,
            ),
            label: 'My BF',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 4?Icons.grid_3x3:Icons.grid_3x3_outlined,
            ),
            label: '전체메뉴',
          ),
        ],
      ),
    );
  }
}
