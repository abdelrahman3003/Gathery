import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/button_navigator_bar_controller.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<ButtonNavigatorBarControllerImp> {
  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.leading,
    this.actions,
  });
  final String title;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: actions,
        bottom: bottom,
        leading: leading

        // IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: Icon(Icons.arrow_back)),
        );
  }
}
