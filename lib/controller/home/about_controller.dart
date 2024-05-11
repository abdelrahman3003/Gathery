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
  String? image;
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await eventsData.getData();

    statusRequest = handlingApiData(response);

    if (statusRequest == StatusRequest.success) {
      eventTitle = response[0]['title'];
      startDat = response[0]['start_date'];
      endDate = response[0]['end_date'];
      image = response[0]['image'];
    }
    update();
  }

  @override
  void onInit() {
    //print("==================${appServices.sharedPreferences.getString("id")}");
    getData();
    super.onInit();
  }
}
