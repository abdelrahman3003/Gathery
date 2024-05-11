
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

class TaskData {
  Crud crud;
  TaskData(this.crud);
  Future<StatusRequest> addTask(
      String member, String title,double num, List<String> option) async {
    return await crud.postData("Tasks", {
      "member": member,
      "title": title,
      "num": num,
      'option': option,
    });
  }
    getTasks() async {
    var response = await crud.getData("Tasks");
    return response.fold((l) => l, (r) => r);
  }
}
