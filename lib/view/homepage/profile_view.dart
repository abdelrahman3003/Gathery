import 'package:flutter/material.dart';
import 'package:note_app/controller/prifile_controller.dart';
import 'package:note_app/view/homepage/widget/profile/priofile_view_body.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControolerImp());
    return const ProfileViewBody();
  }
}
