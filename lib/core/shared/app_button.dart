import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.onPressed,
      required this.name,
      this.textColor,
      this.textSize});
  final void Function()? onPressed;
  final Color? textColor;
  final double? textSize;
  final String name;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 41.h,
      minWidth: 162.w,
      child: Text(
        name,
        style: TextStyle(
          fontSize: textSize ?? 24.sp,
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
