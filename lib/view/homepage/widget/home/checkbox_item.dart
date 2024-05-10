import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/task_detals_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';

class CheckBoxItem extends GetView<TaskDetailsControllerImp> {
  const CheckBoxItem(
      {super.key, required this.title, required this.value, this.onChanged});
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Checkbox(
          value: value,
          onChanged: (value) {
            controller.changeActive(title, value);
          },
          activeColor: AppColor.primary,
        )
      ],
    );
  }
}
