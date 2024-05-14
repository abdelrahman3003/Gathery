import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/task/task_data.dart';
import 'package:note_app/data/model/task_model.dart';

abstract class TasksController extends GetxController {
  fetchTasks();
  changeSlider(double val);
  goToTaskDetails();
}

class TasksControllerImp extends TasksController {
  StatusRequest statusRequest = StatusRequest.none;
  TaskData taskData = TaskData(Get.find());
  double? currentValue;
  List<TaskModel> taskModelList = [];
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
  void fetchTasks() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('Tasks').get();

      statusRequest = handlingApiData(querySnapshot);
      if (statusRequest == StatusRequest.success) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            TaskModel task = TaskModel.fromDocument(doc);
            taskModelList.add(task);
          });
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
