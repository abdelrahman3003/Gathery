import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/controller/home/about_controller.dart';
import 'package:note_app/controller/home/add_task_controller.dart';
import 'package:note_app/controller/home/mytask_controller.dart';
import 'package:note_app/controller/home/tasks_controller.dart';
import 'package:note_app/controller/vote/vote_controller.dart';
import 'package:note_app/view/homepage/home_View.dart';
import 'package:note_app/view/homepage/votes_view.dart';
import 'package:note_app/view/homepage/widget/home/add_task_view.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:note_app/view/homepage/widget/role/role_view.dart';

import '../core/constatnt/services.dart';

abstract class ButtonNavigatorBarController extends GetxController {
  changepage(int i);
  String appBarTilte();
}

class ButtonNavigatorBarControllerImp extends ButtonNavigatorBarController {
  int? pageCount;
  bool isbar = true;
  bool? isini;
  List<Widget> pageList = [
    const HomeView(),
    const AddTaskView(),
    const VotesView(),
    const RoleView(),
  ];
  AppServices appServices = Get.find();
  @override
  void onInit() {
    super.onInit();
    if (appServices.sharedPreferences.getInt("index") == 1) {
      pageCount = 1;
    } else if (appServices.sharedPreferences.getInt("index") == 2) {
      pageCount = 2;
    } else {
      pageCount = 0;
    }
  }

  @override
  changepage(i) {
    switch (i) {
      case 0:
        Get.delete<AddTaskControllerImp>();
        Get.delete<VoteControllerImp>();
        Get.delete<ChatControllerImp>();
        break;
      case 1:
        appServices.sharedPreferences.setInt("index", 1);
        Get.delete<AboutControllerImp>();
        Get.delete<TasksControllerImp>();
        Get.delete<MyTaskSControllerImp>();
        Get.delete<VoteControllerImp>();
        Get.delete<ChatControllerImp>();

        break;
      case 2:
        appServices.sharedPreferences.setInt("index", 2);
        Get.delete<AboutControllerImp>();
        Get.delete<AddTaskControllerImp>();
        Get.delete<ChatControllerImp>();

        break;
      case 3:
        Get.delete<AboutControllerImp>();
        Get.delete<AddTaskControllerImp>();
        Get.delete<VoteControllerImp>();
        break;

      // Add cases for other pages
    }
    pageCount = i;
    appServices.sharedPreferences.setBool("isini", false);
    update();
  }

  @override
  String appBarTilte() {
    if (pageCount == 0) {
      return "Event Details";
    } else if (pageCount == 1) {
      return "Chat";
    } else if (pageCount == 2) {
      return "Add Event";
    }
    return "Others";
  }
}
