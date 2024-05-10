import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/task_detals_controller.dart';
import 'package:note_app/view/homepage/widget/bottom_navigate/costom_appbar.dart';
import 'package:note_app/view/homepage/widget/home/item_text_task_details.dart';
import 'package:note_app/view/homepage/widget/home/subtasks.dart';
import 'package:get/get.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskDetailsControllerImp());
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: "Task Details",
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const ItemTextTaskDeatils(
                    tilte: "Assign UserName", subtilte: "name of user"),
                const ItemTextTaskDeatils(
                    tilte: "Task Name", subtilte: "name of task"),
                const ItemTextTaskDeatils(
                    tilte: "Start task date", subtilte: "date of start task"),
                const ItemTextTaskDeatils(
                    tilte: "End task date", subtilte: "date of start task"),
                const SizedBox(height: 20),
                Text(
                  "Subtasks",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Subtask()
              ],
            ),
          ),
        ));
  }
}
