import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycommunity/src/controller/route_controller.dart';
import 'screens/home_screen.dart';

class RoutesManage extends GetView<RouteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (ScreenName.values[controller.currentIndex.value]) {
          case ScreenName.Home:
            return HomeScreen();
          default:
            return Container();
        }
      },),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: (index) {
            controller.changePageIndex(index);
          },
          items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '구독',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '보관함',
            ),
          ],
        ),
      ),);

  }
}
