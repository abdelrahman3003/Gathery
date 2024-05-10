import 'package:get/get.dart';

validation({required String val, required String type}) {
  if (val.isEmpty) {
    return " Can't be empty ";
  }

  if (type == "Username") {
    if (!GetUtils.isUsername(val) && !GetUtils.isEmail(val)) {
      return "not valid data";
    } else if (val.length < 2) {
      return " Can't be less than 2";
    } else if (val.length > 30) {
      return " Can't be langer than 10";
    }
  }
  if (type == "Email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    } else if (val.length < 10) {
      return " Can't be less than 10";
    } else if (val.length > 30) {
      return " Can't be langer than 30";
    }
  }
  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid Phone";
    } else if (val.length < 11) {
      return " Can't be less than 11";
    } else if (val.length > 11) {
      return " Can't be langer than 11";
    }
  }
  if (type == "Password" ||
      type == "New password" ||
      type == "Retype password") {
    if (val.length < 5) {
      return " Can't be less than 5";
    } else if (val.length > 15) {
      return " Can't be langer than 15";
    }
  }
}
