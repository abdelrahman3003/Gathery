import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home/mytask_controller.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/view/homepage/widget/home/task_item.dart';

class MyTaskView extends StatelessWidget {
  const MyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTaskSControllerImp());
    return GetBuilder<MyTaskSControllerImp>(
        dispose: (state) => Get.delete<MyTaskSControllerImp>(),
        builder: (controller) {
          return DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: controller.myTaskModelList.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.myTaskModelList.length,
                      itemBuilder: (context, index) => TaskItem(
                          taskModel: controller.myTaskModelList[index]),
                    )
                  : Center(child: Text("not task found")));
        });
  }
}
