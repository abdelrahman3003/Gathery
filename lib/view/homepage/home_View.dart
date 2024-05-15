import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_app/controller/home/tasks_controller.dart';
import 'package:note_app/view/homepage/widget/home/about.dart';
import 'package:note_app/view/homepage/widget/home/mytask_view.dart';
import 'package:note_app/view/homepage/widget/home/tasks_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(TasksControllerImp());
    return const TabBarView(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(child: About())),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TasksView(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: MyTaskView(),
      ),
    ]);
  }
}
