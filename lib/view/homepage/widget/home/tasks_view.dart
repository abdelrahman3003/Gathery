import 'package:flutter/material.dart';
import 'package:note_app/controller/home/tasks_controller.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/view/homepage/widget/home/task_item.dart';
import 'package:get/get.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TasksControllerImp());
    return GetBuilder<TasksControllerImp>(builder: (controller) {
      return DataHandlingState(
          statusRequest: controller.statusRequest,
          widget: controller.taskModelList.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.taskModelList.length,
                  itemBuilder: (context, index) => TaskItem(
                    taskModel: controller.taskModelList[index],
                  ),
                )
              : Center(child: Text("no task found")));
    });
  }
}
