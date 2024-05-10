import 'package:get/get.dart';

abstract class TaskDetailsController extends GetxController {
  changeActive(String title, bool? value);
}

class TaskDetailsControllerImp extends TaskDetailsController {
  bool? isActiveCheck1;
  bool? isActiveCheck2;
  bool? isActiveCheck3;
  @override
  void onInit() {
    isActiveCheck1 = false;
    isActiveCheck2 = false;
    isActiveCheck3 = false;
    super.onInit();
  }

  @override
  changeActive(String title, bool? value) {
    if (title == "Check 1") {
      isActiveCheck1 = value;
    } else if (title == "Check 2") {
      isActiveCheck2 = value;
    } else if (title == "Check 3") {
      isActiveCheck3 = value;
    }
    update();
  }
}
