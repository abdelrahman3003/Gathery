import 'dart:typed_data';

import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/core/constatnt/upload_image.dart';

class EventsData {
  Crud crud;
  EventsData(this.crud);
  Future<StatusRequest> safeData(
      String title, String startDate, String endDate, Uint8List image) async {
    String? imageUrl = await uploadImageToFirestorage("imageName", image);
    if (imageUrl != null) {
      return await crud.postData("Events", {
        "title": title,
        "start_date": startDate,
        "end_date": endDate,
        "image": imageUrl
      });
    }
    return StatusRequest.failure;
  }

  getData() async {
    var response = await crud.getData("Events");
    return response.fold((l) => l, (r) => r);
  }
}
