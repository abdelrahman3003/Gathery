import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/button_navigator_bar_controller.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/event/events_data.dart';
import 'package:note_app/data/dataSource/remote/task/task_data.dart';
import 'package:note_app/data/model/task_model.dart';

abstract class TaskDetailsController extends GetxController {
  changeActive(String title, bool value);
  getMembers();
  onChangeDropDownMember(String val);
  onchangeSlider(double value);
  recieveData();
  save();
}

class TaskDetailsControllerImp extends TaskDetailsController {
  EventsData eventsData = EventsData(Get.find());
  late TaskModel taskModel;
  bool isActiveCheck1 = false;
  bool isActiveCheck2 = false;
  bool isActiveCheck3 = false;
  bool isActiveCheck4 = false;
  List<String> options = [];
  List<String> optionsFinished = [];
  AppServices appServices = Get.find();
  List<String> members = [];
  TaskData taskData = TaskData(Get.find());
  StatusRequest statusRequest1 = StatusRequest.none;
  StatusRequest statusRequest = StatusRequest.none;
  String memberValue = "";
  late double sliderValue;
  @override
  onChangeDropDownMember(String val) {
    memberValue = val.toString();
    update();
  }

  @override
  void onInit() {
    taskModel = Get.arguments['taskModel'];
    sliderValue = taskModel.sliderValue;
    getMembers();
    super.onInit();
  }

  @override
  changeActive(String title, bool value) {
    if (title == "Check 1") {
      isActiveCheck1 = value;
    } else if (title == "Check 2") {
      isActiveCheck2 = value;
    } else if (title == "Check 3") {
      isActiveCheck3 = value;
    } else if (title == "Check 4") {
      isActiveCheck4 = value;
    }
    update();
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
        print("======================== 1");
        if (querySnapshot.docs.isNotEmpty) {
          print("======================== 2");
          // Get the first document from the query result
          DocumentSnapshot docSnapshot = querySnapshot.docs.first;

          // Cast the data to a Map<String, dynamic>
          Map<String, dynamic>? data =
              docSnapshot.data() as Map<String, dynamic>?;

          // Check if the data is not null and contains the list field
          if (data != null && data.containsKey('members')) {
            // Access the value of the list field
            members = List<String>.from(data['members']);
            print("======================== members ${members.length}");
            update();
            return members;
          } else {
            print("======================== 3");
            print(
                'List field members not found in document with title members');
            return []; // Return an empty list if list field not found
          }
        } else {
          print("======================== 4");
          print('Document with title event not found');
          return []; // Return an empty list if document not found
        }
      }
      update();
    } catch (e) {
      return []; // Return an empty list if there's an error
    }
  }

  @override
  save() async {
    statusRequest = StatusRequest.loading;
    update();
    // statusRequest = await taskData.addTask(
    //   event: appServices.sharedPreferences.getString("event")!,
    //   member: memberValue,
    //   options: options,
    //   optionsFinished: optionsFinished,
    //   title: taskModel.taskName,
    //   sliderValue: sliderValue,
    // );
    try {
      statusRequest = StatusRequest.loading;
      update();
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await _firestore
          .collection("Tasks")
          .where("member", isEqualTo: taskModel.user)
          .get();

      // Iterate over each document that matches the criteria
      for (DocumentSnapshot doc in querySnapshot.docs) {
        await doc.reference.update({
          "member": memberValue != "" ? memberValue : taskModel.user,
          "sliderValue": sliderValue,
        });
        statusRequest = StatusRequest.success;

        Get.toNamed(kBottomNavigationScreen);
        
      }
      update();
      print('Value updated successfully');
    } catch (e) {
      print('Error updating value: $e');
    }
    update();
  }

  @override
  recieveData() async {
    statusRequest = StatusRequest.loading;
    update();
    CollectionReference collectionReference = await eventsData.getData();
    QuerySnapshot querySnapshot = await collectionReference
        .where('member', isEqualTo: taskModel.user)
        .get();
    statusRequest = handlingApiData(collectionReference);

    if (statusRequest == StatusRequest.success) {
      if (querySnapshot.docs.isNotEmpty) {
        print("================= sucess");
        var response = querySnapshot.docs.first.data() as Map;
        memberValue = response['member'];
        options = response['option'];
        optionsFinished = response['optionFinished'];
      } else {}
    } else {}
    update();
  }

  @override
  onchangeSlider(double value) {
    sliderValue = value;
    update();
  }
}
