import 'package:cloud_firestore/cloud_firestore.dart';
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

  void fetchTasks() async {
    statusRequest = StatusRequest.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('Tasks').get();
      taskModelList = querySnapshot.docs.map((doc) {
        return TaskModel(
          num: doc.data()['num'] ?? 10,
          taskName: doc.data()['title'] ?? '',
          user: doc.data()['member'] ?? '',
        );
      }).toList();
      print("==============${taskModelList.length}");
    } catch (error) {
      statusRequest = StatusRequest.loading;
      print('Error getting tasks: $error');
    }
    update();
  }
}
