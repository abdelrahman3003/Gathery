import 'package:flutter/material.dart';
import 'package:note_app/controller/button_navigator_bar_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/view/homepage/widget/profile/appar_item.dart';
import 'package:get/get.dart';

class AppBottomNavigatorBar extends StatelessWidget {
  const AppBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonNavigatorBarControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: const EdgeInsets.only(bottom: 2),
        color: AppColor.primary,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppbarItem(
                icon: Icons.home,
                iconName: "Home",
                isactive: controller.pageCount == 0 ? true : false,
              ),
              AppbarItem(
                icon: Icons.add,
                iconName: "Task",
                isactive: controller.pageCount == 1 ? true : false,
              ),
              AppbarItem(
                icon: Icons.how_to_vote,
                iconName: "Vote",
                isactive: controller.pageCount == 2 ? true : false,
              ),
              AppbarItem(
                icon: Icons.menu,
                iconName: "Roles",
                isactive: controller.pageCount == 3 ? true : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
