import 'package:flutter/material.dart';
import 'package:note_app/controller/home/tasks_controller.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/homepage/widget/home/task_item.dart';
import 'package:get/get.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TasksControllerImp());
    return GetBuilder<TasksControllerImp>(builder: (controller) {
      return controller.taskModelList.isEmpty
          ? const Center(child: Text("not tasks found"))
          : controller.statusRequest == StatusRequest.loading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.taskModelList.length,
                  itemBuilder: (context, index) => TaskItem(
                      label: controller.taskModelList[index].sliderValue
                          .toString(),
                      onTap: () {
                        controller.onTapTask(index);
                      },
                      taskModel: controller.taskModelList[index]),
                );
    });
  }
}
