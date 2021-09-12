import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_time/src/controller/bottom_bar_controller.dart';
import 'package:my_time/src/screens/mainScreens/main_food.dart';
import 'package:my_time/src/screens/mainScreens/main_home.dart';
import 'package:my_time/src/screens/mainScreens/main_rider.dart';
import 'package:my_time/src/screens/mainScreens/main_user.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomBarController _bottomBarController = Get.put(BottomBarController());

  User? user;
  String userName = '';
  String userImageURL =
      'https://upload.wikimedia.org/wikipedia/commons/e/e0/Userimage.png';

  @override
  initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user!.displayName != null) {
      userName = user!.displayName!;
    }
    if (user!.photoURL != null) {
      userImageURL = user!.photoURL!;
    }
    super.initState();
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        'CNU 밥차',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.green,
        ),
      ),
      actions: [
        Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userImageURL),
                ),
              ),
            ),
            Text(userName),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: FirebaseAuth.instance.signOut,
              icon: Icon(Icons.logout),
              iconSize: 32.0,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: SafeArea(
        child: Obx(() {
          switch (_bottomBarController.currentIndex.value) {
            case 0:
              return MainHomeScreen();
            case 1:
              return MainFoodScreen();
            case 2:
              return MainRiderScreen();
            default:
              return MainUserScreen();
          }
        }),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _bottomBarController.currentIndex.value,
          selectedItemColor: Colors.black,
          onTap: (index) {
            _bottomBarController.changePageIndex(index);
          },
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: '밀키트판매',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.motorcycle_sharp),
              label: '라이더지원',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: '내정보',
            ),
          ],
        ),
      ),
    );
  }
}
