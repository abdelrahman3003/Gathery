import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/event/events_data.dart';

abstract class AboutController extends GetxController {
  getData();
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
  void onInit() {
    //print("==================${appServices.sharedPreferences.getString("id")}");

    eventTitle = Get.arguments['title'];
    getData();
    super.onInit();
  }
}
