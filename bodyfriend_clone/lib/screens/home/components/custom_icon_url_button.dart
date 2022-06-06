import 'package:bodyfriend_clone/models/category.dart';
import 'package:flutter/material.dart';

class CustomIconUrlButton extends StatelessWidget {
  final Category category;
  final Function onPressed;
  const CustomIconUrlButton({
    Key? key,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.network(
                category.icon,
                scale: 2,
              ),
            ),
            Text(
              category.name,
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
