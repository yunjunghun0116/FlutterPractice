import 'package:flutter/material.dart';

class HomeScreenTopCategoryContainer extends StatelessWidget {
  final Function onTapFunction;
  final String categoryTitle;
  final int currentCategoryIndex;
  final int categoryIndex;
  const HomeScreenTopCategoryContainer({
    Key? key,
    required this.onTapFunction,
    required this.categoryTitle,
    required this.currentCategoryIndex, required this.categoryIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: currentCategoryIndex == categoryIndex?const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2),
          ),
        ):null,
        child: Center(
          child: Text(
            categoryTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
