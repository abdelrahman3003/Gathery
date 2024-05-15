import 'package:flutter/material.dart';
import 'package:note_app/controller/home/task_detals_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/view/homepage/widget/home/checkbox_item.dart';
import 'package:get/get.dart';

class Subtask extends StatelessWidget {
  const Subtask({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailsControllerImp>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColor.third),
        child: Column(
          children: [
            CheckBoxItem(title: "Check 1", value: controller.isActiveCheck1!),
            CheckBoxItem(title: "Check 2", value: controller.isActiveCheck2!),
            CheckBoxItem(title: "Check 3", value: controller.isActiveCheck3!),
            CheckBoxItem(title: "Check 4", value: controller.isActiveCheck4!),
          ],
        ),
      );
    });
  }
}
