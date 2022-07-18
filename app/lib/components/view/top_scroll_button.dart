
import 'package:flutter/material.dart';

class TopScrollButton extends StatelessWidget {
  const TopScrollButton({required this.controller, required this.bottomHeight, Key? key}) : super(key: key);
  final ScrollController controller;
  final double bottomHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(child: Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        onPressed: () {controller.animateTo(0.0, duration: const Duration(milliseconds: 200), curve: Curves.ease); },
        backgroundColor: Colors.white,
        child: const Icon(Icons.arrow_upward_outlined, color: Colors.black, size: 20,),
      ),
    ), bottom: bottomHeight, right: 5,);
  }

}
