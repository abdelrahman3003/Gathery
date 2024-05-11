import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/add_task_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/validation.dart';
import 'package:note_app/core/shared/app_button.dart';
import 'package:note_app/view/homepage/task/add_task_view_body.dart';
import 'package:note_app/view/homepage/widget/home/list_add_task.dart';
import 'package:get/get.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTaskControllerImp());
    return const Scaffold(body: AddTaskViewBody());
  }
}
