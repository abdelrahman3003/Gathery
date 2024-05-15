import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  signIn();
  onScure();
  getUserdetails();
}

class SignInControllerImp extends SignInController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isScurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices authServices = FirebaseAuthServices();
  StatusRequest statusRequest = StatusRequest.none;
  Crud crud = Crud();
  AppServices appServices = Get.find();
  @override
  void signIn() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      User? user = await authServices.signInwithEmailandPassword(
          emailController.text, passwordController.text);
      if (user != null) {
        appServices.sharedPreferences.setString("id", emailController.text);
        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully login",
            messageText: const Text(""));
        Get.offNamed(kJoinEventView);
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
  
  @override
  getUserdetails() {

  }
}
