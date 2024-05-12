import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constatnt/binding.dart';
import 'package:note_app/core/constatnt/services.dart';

import 'core/constatnt/routApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await inialServices();
  await Firebase.initializeApp();
  runApp(const Gatherly());
}

class Gatherly extends StatelessWidget {
  const Gatherly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AppServices());
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              initialBinding: AppBinding(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
              getPages: getPages,
            ));
  }
}
