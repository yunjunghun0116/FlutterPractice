import 'package:flutter/material.dart';

class GoogleMapControlButton extends StatelessWidget {
  final String title;
  final Function onClicked;
  const GoogleMapControlButton({
    Key? key,
    required this.title,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await onClicked();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title),
      ),
    );
  }
}
