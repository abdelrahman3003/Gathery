
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

class TaskData {
  Crud crud;
  TaskData(this.crud);
  Future<StatusRequest> addTask(
      String member, String title, String option) async {
    return await crud.postData("Tasks", {
      "member": member,
      "title": title,
      "option": option,
    });
  }
}
