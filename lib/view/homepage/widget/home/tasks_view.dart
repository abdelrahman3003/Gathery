import 'package:flutter/material.dart';
import 'package:note_app/controller/home/tasks_controller.dart';
import 'package:note_app/view/homepage/widget/home/task_item.dart';
import 'package:get/get.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TasksControllerImp());
    return GetBuilder<TasksControllerImp>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.taskModelList.length,
        itemBuilder: (context, index) => TaskItem(
          currentValue: controller.taskModelList[index].num,
          userName: controller.taskModelList[index].user,
          taskName: controller.taskModelList[index].taskName,
        ),
      );
    });
  }
}
