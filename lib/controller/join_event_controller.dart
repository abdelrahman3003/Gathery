import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/event/events_data.dart';
import 'package:note_app/data/dataSource/event/join_event_data.dart';

abstract class JoinEventController extends GetxController {
  changePage();
  securePassword();
  join();
}

class JoinEventControllerImp extends JoinEventController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isJoined = true;
  bool isScurePassword = true;
  bool test = true;
  JoinEvent joinEvent = JoinEvent(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController textEditingTitlController =
      TextEditingController(text: "abdo");
  TextEditingController textEditingPasswordController =
      TextEditingController(text: "123456");
  @override
  changePage() {
    isJoined = !isJoined;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  securePassword() {
    isScurePassword = !isScurePassword;
    update();
  }

  @override
  join() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await joinEvent.join(
        title: textEditingTitlController.text,
        password: textEditingPasswordController.text,
      );

      statusRequest = handlingApiData(response);

      if (statusRequest == StatusRequest.success) {
        CollectionReference collectionReference = response;
        QuerySnapshot querySnapshot=await collectionReference.where('title', isEqualTo: textEditingTitlController.text).get();
        if (querySnapshot.docs.isNotEmpty) {
          print("====================== 1");
          if (querySnapshot.docs.first['password'] ==
              textEditingPasswordController.text) {
            Get.offNamed(kBottomNavigationScreen,
                arguments: {'title': textEditingTitlController.text});

            Get.rawSnackbar(
                title: "Sucess",
                backgroundColor: Colors.grey,
                messageText: const Text(
                  "now you is event admin",
                  style: TextStyle(color: AppColor.white),
                ));
          } else {
            statusRequest = StatusRequest.failure;

            Get.defaultDialog(
              title: "error",
              middleText: "incorrect password",
            );
          }
        } else {
          Get.defaultDialog(
            title: "error",
            middleText: "this event is not found",
          );
          statusRequest = StatusRequest.failure;
        }
      } else {
        Get.defaultDialog(
          title: "error",
          middleText: "invalid data",
        );
        update();
      }
      update();
    }
  }
}
