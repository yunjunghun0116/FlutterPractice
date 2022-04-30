import 'package:flutter/material.dart';

class MainScreenBottomBarItem extends StatelessWidget {
  final String imageUrl;
  const MainScreenBottomBarItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      width: 20,
      height: 20,
    );
  }
}
