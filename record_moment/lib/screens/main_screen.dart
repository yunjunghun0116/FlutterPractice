import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:record_moment/screens/camera_screen.dart';
import 'package:record_moment/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<CameraDescription> _canUseCameraList = [];

  Widget _getMainScreen(){
    switch(_currentIndex){
      case 0:
        return const HomeScreen();
      case 1:
        return CameraScreen(cameraList: _canUseCameraList);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getMainScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index)async{
          if(index == 1){
            _canUseCameraList = await availableCameras();
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: '사진'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: '유저'),
        ],
      ),
    );
  }
}
