import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgetpractice/controllers/google_map_data_controller.dart';
import '../google_map/google_map_screen.dart';
import '../sliver/sliver_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GoogleMapDataController _googleMapController = Get.put(GoogleMapDataController());
  int _currentIndex = 0;

  Widget _getMainArea() {
    switch (_currentIndex) {
      case 0:
        return SafeArea(
          child: Column(
            children: const [
              Text('홈 화면'),
            ],
          ),
        );
      case 1:
        return GoogleMapScreen();
      case 2:
        return const CustomScrollViewPractice();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getMainArea(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '구글맵',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            label: '슬리버앱바',
          ),
        ],
      ),
    );
  }
}
