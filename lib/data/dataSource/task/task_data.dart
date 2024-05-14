import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

class TaskData {
  Crud crud;
  TaskData(this.crud);
  Future<StatusRequest> addTask({
    required String member,
    required String title,
    required List<String> options,
    required List<String> optionsFinished,
    required String event,
  }) async {
    return await crud.postData("Tasks", {
      "member": member,
      "title": title,
      "option": options,
      "optionFinished": optionsFinished,
      'event': event,
    });
  }

  getTasks() async {
    var response = await crud.getLast("Tasks");
    return response.fold((l) => l, (r) => r);
  }

  getMyTasks() async {
    var response = await crud.getLast("Tasks");
    return response.fold((l) => l, (r) => r);
  }
}
