import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/button_navigator_bar_controller.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/task/task_data.dart';

abstract class AddTaskController extends GetxController {
  addCheck();
  addTask();
  onChangeDropDownMember(String val);
  clearFileds();
  getMembers();
}

class AddTaskControllerImp extends AddTaskController {
  int task = 1;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequest1 = StatusRequest.none;
  TaskData taskData = TaskData(Get.find());
  AppServices appServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ButtonNavigatorBarControllerImp buttomController =
      ButtonNavigatorBarControllerImp();
  List<String> members = [];
  String memberValue = "";
  double sliderValue = 5.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController optionController = TextEditingController();
  List<TextEditingController> optionTextFieldList = [TextEditingController()];
  @override
  addCheck() {
    optionTextFieldList.add(TextEditingController());
    update();
  }

  @override
  addTask() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      List<String> enteredDataList =
          optionTextFieldList.map((controller) => controller.text).toList();
      statusRequest = await taskData.addTask(
          event: appServices.sharedPreferences.getString("event")!,
          member: appServices.sharedPreferences.getBool("admin")!
              ? memberValue
              : appServices.sharedPreferences.getString("id")!,
          options: enteredDataList,
          optionsFinished: [],
          title: titleController.text,
          sliderValue: sliderValue);
      if (statusRequest == StatusRequest.success) {
        Get.rawSnackbar(
            backgroundColor: Colors.grey,
            title: "Suceessfully task added",
            messageText: const Text(""));
        // await buttomController.changepage(1);
        //  Get.offAllNamed(kAddTaskView);
        clearFileds();
      }
    }
    update();
  }

  @override
  onChangeDropDownMember(String val) {
    memberValue = val.toString();
    update();
  }

  @override
  clearFileds() {
    memberValue = "";
    titleController.clear();
    optionTextFieldList.clear();
    optionTextFieldList = [TextEditingController()];
    update();
  }

  @override
  void onInit() {
    getMembers();
    super.onInit();
  }

  @override
  getMembers() async {
    try {
      // Query for the document with the matching title
      statusRequest1 = StatusRequest.loading;
      update();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Events') // Replace with your collection name
          .where('title',
              isEqualTo: appServices.sharedPreferences.getString("event"))
          .get();
      statusRequest1 = handlingApiData(querySnapshot);
      // Check if the document exists
      if (statusRequest1 == StatusRequest.success) {
        if (querySnapshot.docs.isNotEmpty) {
          // Get the first document from the query result
          DocumentSnapshot docSnapshot = querySnapshot.docs.first;

          // Cast the data to a Map<String, dynamic>
          Map<String, dynamic>? data =
              docSnapshot.data() as Map<String, dynamic>?;

          // Check if the data is not null and contains the list field
          if (data != null && data.containsKey('members')) {
            // Access the value of the list field
            members = List<String>.from(data['members']);
            update();
            return members;
          } else {
            print(
                'List field members not found in document with title members');
            return []; // Return an empty list if list field not found
          }
        } else {
          print('Document with title event not found');
          return []; // Return an empty list if document not found
        }
      }
      update();
    } catch (e) {
      print('Error getting items from list: $e');
      return []; // Return an empty list if there's an error
    }
  }
}
