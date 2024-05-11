import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:note_app/controller/home/add_task_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/core/constatnt/validation.dart';
import 'package:note_app/core/shared/app_button.dart';
import 'package:note_app/view/homepage/widget/home/list_add_task.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskControllerImp>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  "Choose Member",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.third,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                    items: controller.members.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (val) {
                      controller.onChangeDropDownMember(val.toString());
                    },
                  ),
                ),
                Text(
                  "Task Title",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                    hintText: "Enter task name ",
                    fillColor: AppColor.third,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.third, width: 1.3.h),
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.third, width: 1.3.h),
                        borderRadius: BorderRadius.circular(250)),
                  ),
                  validator: (val) {
                    return validation(type: "Username", val: val!);
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Task checkbox  ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "  (optional)",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const ListAddedTask(),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: controller.addCheck,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50.h, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.third,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.secondry,
                      ),
                      child: DataHandlingState(
                        widget: AppButton(
                            name: "add task", onPressed: controller.addTask),
                        statusRequest: controller.statusRequest,
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
