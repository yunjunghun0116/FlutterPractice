import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  const CustomIconButton({Key? key, required this.title, required this.icon, required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=>onPressed(),
      child: Container(
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
      ),
    );
  }
}
