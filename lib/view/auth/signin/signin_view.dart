import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/auth/sign_in_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/core/constatnt/validation.dart';
import 'package:note_app/core/shared/app_button.dart';
import 'package:get/get.dart';
import 'package:note_app/view/auth/signin/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Scaffold(
        body: GetBuilder<SignInControllerImp>(builder: (controller) {
      return DataHandlingState(
          statusRequest: controller.statusRequest,
          widget: const SignInViewBody());
    }));
  }
}
