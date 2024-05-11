import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  signIn();
  onScure();
}

class SignInControllerImp extends SignInController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isScurePassword = true;
  TextEditingController emailController =
      TextEditingController(text: "abdo@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "123456");
  FirebaseAuthServices authServices = FirebaseAuthServices();
  StatusRequest statusRequest = StatusRequest.none;
  Crud crud = Crud();
  @override
  void signIn() async {
    statusRequest = StatusRequest.loading;
    update();
    if (formKey.currentState!.validate()) {
      User? user = await authServices.signInwithEmailandPassword(
          emailController.text, passwordController.text);
      if (user != null) {
        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully login",
            messageText: const Text(
              "",
            ));
        Get.toNamed(kCreateEvent);
        statusRequest = StatusRequest.success;
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
