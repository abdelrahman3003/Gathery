import 'package:flutter/material.dart';
import 'package:note_app/controller/auth/sign_up_controller.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:get/get.dart';
import 'package:note_app/view/auth/signup/signup_view_body.dart';



class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        body: GetBuilder<SignUpControllerImp>(
      builder: (controller) => DataHandlingState(
        statusRequest: controller.statusRequest,
        widget: const SignupViewBody(),
      ),
    ));
  }
}
