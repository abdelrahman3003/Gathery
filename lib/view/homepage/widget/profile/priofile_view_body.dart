import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/prifile_controller.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/view/homepage/widget/profile/email_address_Section.dart';
import 'package:note_app/view/homepage/widget/profile/flowing_section.dart';
import 'package:note_app/view/homepage/widget/profile/image_profile.dart';
import 'package:note_app/view/homepage/widget/profile/role_information_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControolerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: GetBuilder<ProfileControolerImp>(builder: (controller) {
          return DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  const ImageProfile(),
                  const SizedBox(height: 20),
                  Text(
                    controller.userModel!.name,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  FollowingSection(
                      followers: "${controller.userModel!.follower}",
                      following: "${controller.userModel!.following}"),
                  const SizedBox(height: 30),
                  Align(
                      alignment: Alignment.topLeft,
                      child: EmailAddressSection(
                          email: controller.userModel!.email)),
                  const SizedBox(height: 30),
                ],
              ));
        }),
      ),
    );
  }
}
