import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/task_detals_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/event/widget/join_event/join.dart';
import 'package:note_app/view/homepage/widget/home/item_text_task_details.dart';
import 'package:get/get.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offNamed(kBottomNavigationScreen);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const Text("Task details"),
          centerTitle: true,
        ),
        body: GetBuilder<TaskDetailsControllerImp>(builder: (controller) {
          return controller.statusRequest != StatusRequest.loading
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        controller.appServices.sharedPreferences
                                .getBool("admin")!
                            ? const Text(
                                "asign anthor user",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 20),
                        controller.appServices.sharedPreferences
                                .getBool("admin")!
                            ? DataHandlingState(
                                statusRequest: controller.statusRequest1,
                                widget: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.third,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    dropdownColor: AppColor.third,
                                    value: controller.memberValue.isNotEmpty
                                        ? controller.memberValue
                                        : null, // guard it with null if empty
                                    hint: Text(
                                      'Your Section',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    icon: const Icon(Icons.keyboard_arrow_down,
                                        color: Colors.black),
                                    iconSize: 30,
                                    items:
                                        controller.members.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (val) {
                                      controller.onChangeDropDownMember(
                                          val.toString());
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        ItemTextTaskDeatils(
                            tilte: "Assign UserName",
                            subtilte: controller.taskModel.user),
                        ItemTextTaskDeatils(
                            tilte: "Task Name",
                            subtilte: controller.taskModel.taskName),
                        const SizedBox(height: 20),
                        Slider(
                          value: controller.sliderValue,
                          onChanged: (val) {
                            controller.onchangeSlider(val);
                          },
                          max: 100,
                          divisions: 4,
                          label: controller.sliderValue.round().toString(),
                        ),
                        const SizedBox(height: 30),
                        controller.statusRequest == StatusRequest.loading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox(),
                        const SizedBox(height: 30),
                        Join(
                          color: AppColor.primary,
                          textColor: AppColor.white,
                          text: "save",
                          onPressed: () {
                            controller.save();
                          },
                        )
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        }));
  }
}
