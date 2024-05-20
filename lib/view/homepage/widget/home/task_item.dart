import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/tasks_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';
import 'package:note_app/data/model/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
    required this.onTap,
    required this.label,
  });
  final TaskModel taskModel;
  final void Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 120.h,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColor.third,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskModel.user,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    taskModel.taskName,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Slider(
                value: taskModel.sliderValue,
                onChanged: (val) {},
                max: 100,
                divisions: 5,
                label: label
              )
            ],
          )),
    );
  }
}
