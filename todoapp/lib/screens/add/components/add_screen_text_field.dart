import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddScreenTextField extends StatelessWidget {
  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  const AddScreenTextField({
    Key? key,
    required this.label,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(border: underlineGreyBorder),
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}
