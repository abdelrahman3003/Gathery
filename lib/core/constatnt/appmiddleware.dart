import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/routApp.dart';

import 'services.dart';

class AppMiddleWare extends GetMiddleware {
  @override
  int? priority = 0;
  AppServices appServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: kBottomNavigationScreen);
    }
    if (appServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: kJoinEventView);
    }

    return null;
  }
}
