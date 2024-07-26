import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/event/events_data.dart';
import 'package:note_app/data/dataSource/remote/task/task_data.dart';
import 'package:note_app/data/model/task_model.dart';

abstract class TaskDetailsController extends GetxController {
  getMembers();
  onChangeDropDownMember(String val);
  onchangeSlider(double value);
  recieveData();
  save();
}

class TaskDetailsControllerImp extends TaskDetailsController {
  EventsData eventsData = EventsData(Get.find());
  late TaskModel taskModel;

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
            return []; // Return an empty list if list field not found
          }
        } else {
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

    try {
      statusRequest = StatusRequest.loading;
      update();
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await firestore
          .collection("Tasks")
          .where("title", isEqualTo: taskModel.taskName)
          .get();

      // Iterate over each document that matches the criteria
      for (DocumentSnapshot doc in querySnapshot.docs) {
        await doc.reference.update({
          "member": memberValue != "" ? memberValue : taskModel.user,
          "sliderValue": sliderValue,
        });
        statusRequest = StatusRequest.success;
      }
      update();
    } catch (e) {}
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
