import 'package:flutter/material.dart';

import '../../../constants.dart';

class InviteTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function refreshFunction;
  final TextInputType? textInputType;
  const InviteTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.refreshFunction,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        onChanged: (String s) => refreshFunction(s),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kLightGreyColor,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kLightGreyColor,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kLightGreyColor,
            ),
          ),
          focusColor: kLightGreyColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: kLightGreyColor,
          ),
        ),
        cursorColor: Colors.deepPurple,
      ),
    );
  }
}
