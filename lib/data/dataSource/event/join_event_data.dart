import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

class JoinEvent {
  Crud crud;
  JoinEvent(this.crud);

  join({required String title, required String password}) async {
    var respose = await crud.getLast("Events");
    return respose.fold((l) => l, (r) => r);
  }

  Future<StatusRequest> addUser(
      {required String member, required String event}) async {
    return await crud.postData("Tasks", {
      "member": member,
      'event': event,
    });
  }
}
