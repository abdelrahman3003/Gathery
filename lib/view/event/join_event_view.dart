import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/join_event_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/assets.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/validation.dart';
import 'package:note_app/view/event/widget/join_event/join.dart';
import 'package:get/get.dart';
import 'package:note_app/view/event/widget/join_event/join_body.dart';

class JoinEventView extends StatelessWidget {
  const JoinEventView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JoinEventControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(kProfileView);
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage(ImageAsset.person),
                // backgroundImage: NetworkImage(
                //     'https://example.com/profile_picture.jpg'), // Replace with your profile picture URL
              ),
            ),
          ),
        ),
        body: GetBuilder<JoinEventControllerImp>(builder: (controller) {
          return DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: const JoinBody());
        }));
  }
}
