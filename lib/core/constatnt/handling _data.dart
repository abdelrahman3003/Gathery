
import 'package:note_app/core/constatnt/statuscode.dart';

handlingApiData(response) {
  if (response is StatusRequest) {
    return response;
  }
  return StatusRequest.success;
}
