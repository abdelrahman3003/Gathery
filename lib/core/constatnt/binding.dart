import 'package:get/get.dart';
import 'package:note_app/core/constatnt/crud.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
