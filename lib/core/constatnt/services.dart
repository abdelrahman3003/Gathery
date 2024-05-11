import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:note_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<AppServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

inialServices() async {
  await Get.putAsync(() => AppServices().init());
}
