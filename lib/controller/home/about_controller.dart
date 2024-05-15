import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/event/events_data.dart';

abstract class AboutController extends GetxController {
  getData();
  settypeUser();
}

class AboutControllerImp extends AboutController {
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  EventsData eventsData = EventsData(Get.find());
  String eventTitle = "";
  String startDat = "";
  String endDate = "";
  int numMebmers = 0;
  String? image;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    CollectionReference collectionReference = await eventsData.getData();
    QuerySnapshot querySnapshot =
        await collectionReference.where('title', isEqualTo: eventTitle).get();
    statusRequest = handlingApiData(collectionReference);

    if (statusRequest == StatusRequest.success) {
      if (querySnapshot.docs.isNotEmpty) {
        print("================= sucess");
        var response = querySnapshot.docs.first.data() as Map;
        eventTitle = response['title'];
        startDat = response['start_date'];
        endDate = response['end_date'];
        image = response['image'];
        numMebmers = List<String>.from(response['members']).length;
      } else {}
    } else {}
    update();
  }

  @override
  void onInit() async {
    //print("==================${appServices.sharedPreferences.getString("id")}");
    print(
        "======================= isadmin ${await appServices.sharedPreferences.getBool("admin")}");
    eventTitle = Get.arguments['title'];
    getData();
    super.onInit();
  }

  @override
  settypeUser() async {
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
          .collection("users")
          .where("email", isEqualTo: "id")
          .get();

      // Iterate over each document that matches the criteria
      for (DocumentSnapshot doc in querySnapshot.docs) {
        int numAdmin = querySnapshot.docs.first['leader'] + 1;
        int numParticipant = querySnapshot.docs.first['participant'] + 1;

        await doc.reference.update({
          "leader": appServices.sharedPreferences.getBool("admin") == true
              ? numAdmin
              : querySnapshot.docs.first['leader'],
          "participant": appServices.sharedPreferences.getBool("admin") == true
              ? numParticipant
              : querySnapshot.docs.first['participant'],
        });
      }
    } catch (e) {
      print('Error updating value: $e');
    }
    update();
  }
}
