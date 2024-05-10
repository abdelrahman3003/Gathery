import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';

abstract class AddTaskController extends GetxController {
  addCheck();
  addTask();
  onChangeDropDownMember(String val);
}

class AddTaskControllerImp extends AddTaskController {
  int task = 1;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> members = [
    'member1',
    'member2',
    'member3',
    'member4',
  ];
  String memberValue = "";
  @override
  addCheck() {
    task++;
    update();
  }

  @override
  addTask() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.toNamed(kTaskDetailsView);
    }
    update();
  }

  @override
  onChangeDropDownMember(String val) {
    memberValue = val.toString();
    update();
  }
}
