import 'package:app/models/home/home_category_model.dart';
import 'package:flutter/material.dart';

class CustomIconUrlButton extends StatelessWidget {
  final HomeCategory homeCategory;
  final Function onPressed;

  const CustomIconUrlButton({
    Key? key,
    required this.homeCategory,
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
                homeCategory.icon,
                scale: 2,
              ),
            ),
            Text(
              homeCategory.name,
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
