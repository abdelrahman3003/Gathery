import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/profile_controller.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/homepage/widget/profile/priofile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControolerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileControolerImp>(builder: (controller) {
        return controller.statusRequest != StatusRequest.loading
            ? const ProfileViewBody()
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
