import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/task/task_data.dart';
import 'package:note_app/data/model/task_model.dart';

abstract class TasksController extends GetxController {
  fetchTasks();
  changeSlider(double val);
  goToTaskDetails(String assignuser);
  onTapTask(int index);
}

class TasksControllerImp extends TasksController {
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  TaskData taskData = TaskData(Get.find());
  double currentValue = 5;
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
  goToTaskDetails(String assignuser) {
    Get.toNamed(kTaskDetailsView, arguments: {"assignuser": assignuser});
  }

  @override
  void fetchTasks() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('Tasks')
              .where('event',
                  isEqualTo: appServices.sharedPreferences.getString("event"))
              .get();
     
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
    }
    update();
  }

  @override
  onTapTask(int index) {
    if (appServices.sharedPreferences.getBool("admin")! ||
        taskModelList[index].user ==
            appServices.sharedPreferences.getString("id")) {
      Get.offNamed(kTaskDetailsView,
          arguments: {'taskModel': taskModelList[index]});
    }
    update();
  }
}
