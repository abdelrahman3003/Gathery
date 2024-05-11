import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/auth/firebase_auth.dart';
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
  TextEditingController nameController = TextEditingController(text: "abdo");
  TextEditingController emailController =
      TextEditingController(text: "abdo@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "123456");
  bool isScurePassword = true;
  FirebaseAuthServices authServices = FirebaseAuthServices();
  StatusRequest statusRequest = StatusRequest.none;
  Crud crud = Crud();
  @override
  void signUp() async {
    statusRequest = StatusRequest.loading;
    update();
    if (formKey.currentState!.validate()) {
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
      'password': passwordController.text
    });
  }

  @override
  Future<void> getUsers() async {
    FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
    statusRequest = StatusRequest.loading;
    update();
    var response = await firebaseAuthServices.viewUsers("users");
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      print("-------------- ${response[0]['name']}");
    }

    update();
  }
}
