import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/button_navigator_bar_controller.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/view/homepage/widget/bottom_navigate/appButtonNavigarBar.dart';
import 'package:note_app/view/homepage/widget/bottom_navigate/costom_appbar.dart';
import 'package:note_app/view/homepage/widget/vote/widget/popMenu_vote.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ButtonNavigatorBarControllerImp());
    return DefaultTabController(
      length: 2,
      child: GetBuilder<ButtonNavigatorBarControllerImp>(builder: (controller) {
        return Scaffold(
           
            appBar: PreferredSize(
              preferredSize: controller.pageCount == 0
                  ? Size.fromHeight(100.h)
                  : Size.fromHeight(50.h),
              child: CustomAppBar(
                title: controller.pageCount == 3
                    ? "MY Profile"
                    : controller.pageCount == 2
                        ? "Add Vote"
                        : controller.pageCount == 1
                            ? "Add task"
                            : "Event Details",
                bottom: controller.pageCount == 0
                    ? const TabBar(tabs: [
                        Tab(text: "About"),
                        Tab(text: "Tasks"),
                      ])
                    : const PreferredSize(
                        preferredSize: Size.zero, child: SizedBox()),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(kChatView);
                      },
                      icon: const Icon(Icons.chat)),
                  controller.pageCount == 2
                      ? const PopmenuVote()
                      : const SizedBox()
                ],
              ),
            ),
            bottomNavigationBar: const AppBottomNavigatorBar(),
            // floatingActionButtonLocation: controller.pageCount == 1
            //     ? null
            //     : FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FloatingActionButton(
            //       backgroundColor: AppColor.primary,
            //       onPressed: () {
            //         Get.toNamed(kAddTaskView);
            //       },
            //       child: const Icon(
            //         Icons.add,
            //         size: 32,
            //       )),
            // ),
            body: GetBuilder<ButtonNavigatorBarControllerImp>(
              builder: (controllerbuild) {
                return SafeArea(
                    child: controllerbuild.pageList[controllerbuild.pageCount]);
              },
            ));
      }),
    );
  }
}
