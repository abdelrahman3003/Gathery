import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/event/events_data.dart';
import 'package:note_app/data/task/task_data.dart';

abstract class AddTaskController extends GetxController {
  addCheck();
  addTask();
  onChangeDropDownMember(String val);
}

class AddTaskControllerImp extends AddTaskController {
  int task = 1;
  StatusRequest statusRequest = StatusRequest.none;
  TaskData taskData = TaskData(Get.find());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> members = [
    'member1',
    'member2',
    'member3',
    'member4',
  ];
  String memberValue = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController optionController = TextEditingController();

  @override
  addCheck() {
    task++;
    update();
  }

  @override
  addTask() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      statusRequest = await taskData.addTask(
          memberValue, titleController.text, optionController.text);
      if (statusRequest == StatusRequest.success) {
           Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully task added",
            messageText: const Text(""));
      }
    }
    update();
  }

  @override
  onChangeDropDownMember(String val) {
    memberValue = val.toString();
    update();
  }
}
