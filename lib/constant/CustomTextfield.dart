import 'package:flutter/material.dart';
import 'package:note_app/constant/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.onSaved,
    this.maxLines = 1,
  });
  final String hintText;
  final Function(String?)? onSaved;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
