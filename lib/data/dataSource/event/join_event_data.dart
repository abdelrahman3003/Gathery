import 'package:note_app/core/constatnt/crud.dart';

class JoinEvent {
  Crud crud;
  JoinEvent(this.crud);

  join({required String title, required String password}) async {
    var respose = await crud.getLast("Events");
    return respose.fold((l) => l, (r) => r);
  }
}
