import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_market/screens/favorite.dart';
import 'home.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  Widget _bodyWidget() {
    switch (_currentIndex) {
      case 0:
        return Home();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return FavoriteContentsView();
    }
    return Home();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String label, String iconName) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        'assets/svg/${iconName}_off.svg',
        width: 22.0,
      ),
      activeIcon: SvgPicture.asset(
        'assets/svg/${iconName}_on.svg',
        width: 22.0,
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.black,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          print(_currentIndex);
        });
      },
      items: [
        _bottomNavigationBarItem('홈', 'home'),
        _bottomNavigationBarItem('동네생활', 'notes'),
        _bottomNavigationBarItem('내근처', 'location'),
        _bottomNavigationBarItem('채팅', 'chat'),
        _bottomNavigationBarItem('나의 당근', 'user'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
