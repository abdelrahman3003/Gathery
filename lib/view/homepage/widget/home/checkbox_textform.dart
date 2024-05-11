import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/validation.dart';

class CheckboxTextForm extends StatelessWidget {
  const CheckboxTextForm({super.key, this.controller});
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: " task checkbox ",
          fillColor: AppColor.third,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.third, width: 1.3.h),
              borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.third, width: 1.3.h),
              borderRadius: BorderRadius.circular(250)),
        ),
        validator: (val) {
          return validation(type: "Username", val: val!);
        },
      ),
    );
  }
}
