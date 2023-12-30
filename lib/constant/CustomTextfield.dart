import 'package:flutter/material.dart';
import 'package:note_app/constant/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.onSaved,
    this.maxLines = 1,
    this.onChanged,
    this.initialValue = '',
  });
  final String hintText;
  final String initialValue;
  final Function(String?)? onSaved;
  final int maxLines;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: kprimarycolor,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "this value is required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kprimarycolor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: kprimarycolor,
            )),
      ),
    );
  }
}
