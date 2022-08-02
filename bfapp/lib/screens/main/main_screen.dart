import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/local_controller.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/screens/event/event_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/home/pages/login/login_page.dart';
import 'package:app/screens/main/components/main_screen_bottom_bar_item.dart';
import 'package:app/screens/menu/menu_screen.dart';
import 'package:app/screens/mybf/mybf_screen.dart';
import 'package:app/screens/shopping/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(UserController());
  }

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
            MybfScreen(),
            MenuScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMainColor,
        onTap: (int index) async {//async : 힙 영역으로 해당 코드를 보내라, await : 함수를 기달려라
          if (index == 3 && UserController.to.user == null) {
            Map<String, dynamic>? userData =
                await Get.to(() => const LoginPage());
            if (userData == null) return;
            await UserController.to.loginUser(
              loginId: userData['userId'],
              userIdx: userData['userIdx'],
            );
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_home@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_home_fill@3x.png',
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_event@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_event_fill@3x.png',
            ),
            label: '이벤트',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_shopping@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_shopping_fill@3x.png',
            ),
            label: '쇼핑',
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_mypage@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_mypage_fill@3x.png',
            ),
            label: "MY BF",
          ),
          BottomNavigationBarItem(
            icon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_menu@3x.png',
            ),
            activeIcon: MainScreenBottomBarItem(
              imageUrl: 'images/ic_menu_fill@3x.png',
            ),
            label: "전체메뉴",
          ),
        ],
      ),
    );
  }
}
