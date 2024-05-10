import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/validation.dart';

class CheckboxTextForm extends StatelessWidget {
  const CheckboxTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
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
          ),
        ),
        Checkbox(
            activeColor: AppColor.primary, value: true, onChanged: (val) {})
      ],
    );
  }
}
