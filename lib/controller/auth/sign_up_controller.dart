import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/constatnt/handling _data.dart';

abstract class SignUpController extends GetxController {
  signUp();
  Future<void> addUserDetails();
  Future<void> getUsers();
  onScure();
}

class SignUpControllerImp extends SignUpController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isScurePassword = true;
  FirebaseAuthServices authServices = FirebaseAuthServices();

  StatusRequest statusRequest = StatusRequest.none;
  Crud crud = Crud();
  AppServices appServices = Get.find();
  @override
  void signUp() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      getUsers();
      User? user = await authServices.signUPwithEmailandPassword(
          emailController.text, passwordController.text);
      if (user != null) {
        await addUserDetails();

        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully registerd",
            messageText: const Text(
              "",
            ));
        statusRequest = StatusRequest.success;

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

  @override
  Future<void> addUserDetails() async {
    statusRequest = await crud.postData('users', {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'following': 0,
      'follower': 0,
      'leader': 0,
      'participant': 0,
    });
  }

  @override
  Future<void> getUsers() async {
    FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
    statusRequest = StatusRequest.loading;
    update();
    var response = await firebaseAuthServices.viewUsers("users");
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {}

    update();
  }
}
