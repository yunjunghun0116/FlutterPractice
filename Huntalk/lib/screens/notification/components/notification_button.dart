import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onPressed;
  const NotificationButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(icon),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
