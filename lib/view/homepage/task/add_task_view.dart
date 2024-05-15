import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home/add_task_controller.dart';
import 'package:note_app/view/homepage/task/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddTaskControllerImp());
    return AddTaskViewBody();
  }
}
