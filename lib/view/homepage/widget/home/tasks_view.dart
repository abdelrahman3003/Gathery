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
      return SingleChildScrollView(
        child: Column(
          children: [
            TaskItem(
              currentValue: controller.currentValue!,
              userName: "userName 1",
              taskName: "taskName 1",
            ),
            TaskItem(
              currentValue: controller.currentValue!,
              userName: "userName 2",
              taskName: "taskName 2",
            ),
            TaskItem(
              currentValue: controller.currentValue!,
              userName: "userName 3",
              taskName: "taskName 3",
            ),
            TaskItem(
              currentValue: controller.currentValue!,
              userName: "userName 4",
              taskName: "taskName 4",
            ),
          ],
        ),
      );
    });
  }
}
