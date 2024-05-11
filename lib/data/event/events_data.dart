import 'dart:typed_data';

import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/core/constatnt/upload_image.dart';

class EventsData {
  Crud crud = Crud();
  Future<StatusRequest> safeData(
      String title, String startDate, String endDate, Uint8List image) async {
    String? imageUrl = await uploadImageToFirestorage("imageName", image);
    return await crud.postData("Events", {
      "title": title,
      "start_date": startDate,
      "end_date": endDate,
      "image": imageUrl!
    });
  }
}
