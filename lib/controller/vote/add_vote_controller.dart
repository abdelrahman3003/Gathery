import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';

abstract class AddVoteController extends GetxController {
  addTask();
  addOption();
}

class AddVoteControllerImp extends AddVoteController {
  int optionsNUm = 1;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  addTask() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.toNamed(kTaskDetailsView);
    }
    update();
  }

  @override
  addOption() {
    optionsNUm++;
    update();
  }
}
