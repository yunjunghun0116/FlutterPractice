import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onSaved: (val)=>onSaved(val),
            validator: (val)=>validator(val),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: const TextStyle(
                fontSize: 18,
              ),
              labelText: label,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
            ),
            keyboardType: TextInputType.text,
            maxLines: 100,
            minLines: 1,
          )
        ],
      ),
    );
  }
}
