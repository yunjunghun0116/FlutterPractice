import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomIconButton({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
       mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
