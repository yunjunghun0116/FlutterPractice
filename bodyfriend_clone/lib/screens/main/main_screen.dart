import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/chair_controller.dart';
import 'package:bodyfriend_clone/screens/connect/connect_screen.dart';
import 'package:bodyfriend_clone/screens/event/event_screen.dart';
import 'package:bodyfriend_clone/screens/home/home_screen.dart';
import 'package:bodyfriend_clone/screens/main/components/main_screen_bottom_bar_item.dart';
import 'package:bodyfriend_clone/screens/shopping/shopping_screen.dart';
import 'package:bodyfriend_clone/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put(ChairController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children:  const [
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
        items: const [
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_home@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_home_fill@3x.png',
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_event@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_event_fill@3x.png',
            ),
            label: '이벤트',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_shopping@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_shopping_fill@3x.png',
            ),
            label: '쇼핑',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_mypage@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_mypage_fill@3x.png',
            ),
            label: 'My BF',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_menu@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'assets/memberships/ic_menu_fill@3x.png',
            ),
            label: '전체메뉴',
          ),
        ],
      ),
    );
  }
}
