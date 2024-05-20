import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

abstract class AddVoteController extends GetxController {
  addvoting();
  addOption();
}

class AddVoteControllerImp extends AddVoteController {
  int optionsNUm = 1;
  List<Map<String, dynamic>> options = [];
  TextEditingController titleController = TextEditingController();
  List<TextEditingController> optionControllers = [];
  Map<String, dynamic> data = {};
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CollectionReference voteCollection =
      FirebaseFirestore.instance.collection('votes');
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<String> users = [];
  @override
  void onInit() {
    optionControllers.add(TextEditingController());

    super.onInit();
  }

  @override
  addvoting() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      for (var i = 0; i < optionControllers.length; i++) {
        options.add(
          {"answer": optionControllers[i].text, "percent": 0, "id": i},
        );
      }
      data = {
        "title": titleController.text,
        "user": appServices.sharedPreferences.getString("id"),
        "event": appServices.sharedPreferences.getString("event"),
        "date": FieldValue.serverTimestamp(),
        "options": options,
        "voters": users
      };
      try {
        await voteCollection.add(data);
        statusRequest = StatusRequest.success;
        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully,vote  added ",
            messageText: const Text(""));

        options.clear();
      } catch (e) {
        Get.defaultDialog(
          title: "error",
          middleText: "invalid details",
        );
        statusRequest = StatusRequest.failure;
        print("stat=========== $e");
      }
      titleController.clear();
      optionControllers.clear();
      optionControllers.add(TextEditingController());
      Get.offAllNamed(kBottomNavigationScreen);
      update();
    }
  }

  @override
  addOption() {
    optionControllers.add(TextEditingController());

    update();
  }
}
