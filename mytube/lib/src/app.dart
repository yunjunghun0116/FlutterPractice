import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mytube/src/screens/explore.dart';
import 'package:mytube/src/screens/library.dart';
import 'package:mytube/src/screens/subscribe.dart';
import 'controller/app_controller.dart';
import 'screens/home.dart';

// 앱의 루트에 해당하는 컴포넌트
// app_controller를 호출한 후 app_controller.to.currentIndex를 통해 접근할수있지만
// 또다른 방법인 GetView<컨트롤러> 를 통해서 controller.currentIndex로 접근하는방법도 있다.
class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch (ScreenName.values[controller.currentIndex.value]) {
            case ScreenName.Home:
              return Home();
            case ScreenName.Explore:
              return Explore();
            case ScreenName.Add:
              return Home();
            case ScreenName.Subscribe:
              return Subscribe();
            case ScreenName.Library:
              return Library();
            default:
              return Container();
          }
        }),
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
                icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/icons/compass_off.svg',
                  width: 20,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/icons/compass_on.svg',
                  width: 20,
                ),
                label: '탐색',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    'assets/svg/icons/plus.svg',
                    width: 40,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg'),
                label: '구독',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg'),
                label: '보관함',
              ),
            ],
          ),
        ));
  }
}
