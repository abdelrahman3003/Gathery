import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';

abstract class TasksController extends GetxController {
  changeSlider(double val);
  goToTaskDetails();
}

class TasksControllerImp extends TasksController {
  double? currentValue;
  @override
  void onInit() {
    currentValue = 10;
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
}
