import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onClicked;
  const CustomButton({
    Key? key, required this.title, required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onClicked();
        },
        child: Text(title),
      ),
    );
  }
}
