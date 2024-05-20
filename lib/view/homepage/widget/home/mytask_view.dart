import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home/mytask_controller.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/homepage/widget/home/task_item.dart';

class MyTaskView extends StatelessWidget {
  const MyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTaskSControllerImp());
    return GetBuilder<MyTaskSControllerImp>(builder: (controller) {
      return controller.myTaskModelList.isEmpty
          ? const Center(child: Text("not tasks found"))
          : controller.statusRequest == StatusRequest.loading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.myTaskModelList.length,
                  itemBuilder: (context, index) => TaskItem(
                      label: controller.myTaskModelList[index].sliderValue.toString(),
                      onTap: () {
                        controller.onTapTask(index);
                      },
                      taskModel: controller.myTaskModelList[index]),
                );
    });
  }
}
