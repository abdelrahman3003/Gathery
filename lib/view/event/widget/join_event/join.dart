import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/shared/app_button.dart';

class Join extends StatelessWidget {
  const Join({
    super.key,
    required this.color,
    required this.textColor,
    required this.text,
    this.onPressed,
  });
  final String text;
  final Color? color;
  final Color? textColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 166.w,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color ?? AppColor.primary),
        child: AppButton(
          name: text,
          textSize: 18.sp,
          textColor: textColor ?? AppColor.white,
          onPressed: onPressed,
        ));
  }
}
