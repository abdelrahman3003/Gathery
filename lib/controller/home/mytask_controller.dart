import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/task/task_data.dart';
import 'package:note_app/data/model/task_model.dart';

abstract class MyTaskSController extends GetxController {
  getMyTasks();
  changeSlider(double val);
  goToTaskDetails();
}

class MyTaskSControllerImp extends MyTaskSController {
  StatusRequest statusRequest = StatusRequest.none;
  TaskData taskData = TaskData(Get.find());
  AppServices appServices = Get.find();
  double? currentValue;
  List<TaskModel> myTaskModelList = [];
  @override
  void onInit() {
    currentValue = 10;
    fetchTasks();
    super.onInit();
  }

  @override
  changeSlider(double val) {
    currentValue = val;
    update();
  }

  @override
  goToTaskDetails() {
    Get.toNamed(kTaskDetailsView);
  }

  @override
  getMyTasks() async {
    statusRequest = StatusRequest.loading;
    update();
    CollectionReference collectionReference = await taskData.getMyTasks();
    QuerySnapshot querySnapshot = await collectionReference
        .where('event',
            isEqualTo: appServices.sharedPreferences.getString("event"))
        .where('member',
            isEqualTo: appServices.sharedPreferences.getString("id"))
        .get();

    statusRequest = handlingApiData(querySnapshot);
    if (statusRequest == StatusRequest.success) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          TaskModel task = TaskModel.fromDocument(doc);
          myTaskModelList.add(task);
        });
      }
    }
    update();
  }

  void fetchTasks() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('Tasks')
              .where('event',
                  isEqualTo: appServices.sharedPreferences.getString("event"))
              .where('member',
                  isEqualTo: appServices.sharedPreferences.getString("id"))
              .get();

      statusRequest = handlingApiData(querySnapshot);
      if (statusRequest == StatusRequest.success) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            TaskModel task = TaskModel.fromDocument(doc);
            myTaskModelList.add(task);
          });
        } else {
          print("========================= emoty");
        }
      }
      update();
    } catch (error) {
      statusRequest = StatusRequest.loading;
      print('Error getting tasks: $error');
    }
    update();
  }
}
