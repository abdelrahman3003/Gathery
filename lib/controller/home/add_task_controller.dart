import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/task/task_data.dart';

abstract class AddTaskController extends GetxController {
  addCheck();
  addTask();
  onChangeDropDownMember(String val);
  clearFileds();
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
  double num = 5.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController optionController = TextEditingController();
  List<TextEditingController> optionTextFieldList = [TextEditingController()];
  @override
  addCheck() {
    optionTextFieldList.add(TextEditingController());
    update();
  }

  @override
  addTask() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      List<String> enteredDataList =
          optionTextFieldList.map((controller) => controller.text).toList();
      statusRequest = await taskData.addTask(
          memberValue, titleController.text, num, enteredDataList);
      if (statusRequest == StatusRequest.success) {
        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully task added",
            messageText: const Text(""));
        clearFileds();
      }
    }
    update();
  }

  @override
  onChangeDropDownMember(String val) {
    memberValue = val.toString();
    update();
  }

  @override
  clearFileds() {
    memberValue = "";
    titleController.clear();
    optionTextFieldList.clear();
    optionTextFieldList = [TextEditingController()];
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
