import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  onScure();
}

class SignUpControllerImp extends SignUpController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "abdo");
  TextEditingController emailController =
      TextEditingController(text: "abdp@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "123456");
  bool isScurePassword = true;
  FirebaseAuthServices authServices = FirebaseAuthServices();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void signUp() async {
    statusRequest = StatusRequest.loading;
    update();
    if (formKey.currentState!.validate()) {
      User? user = await authServices.signUPwithEmailandPassword(
          emailController.text, passwordController.text);
      if (user != null) {
        statusRequest = StatusRequest.success;
        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully login",
            messageText: const Text(
              "",
            ));
        Get.toNamed(kSignInView);
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "invalid details",
        );
      }
      update();
    }

    update();
  }

  @override
  onScure() {
    isScurePassword = !isScurePassword;
    update();
  }
}
