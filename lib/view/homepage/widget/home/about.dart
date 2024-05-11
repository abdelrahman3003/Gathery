import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home/about_controller.dart';
import 'package:note_app/view/homepage/widget/home/about_item.dart';
import 'package:note_app/view/homepage/widget/home/messages_text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AboutControllerImp());
    return GetBuilder<AboutControllerImp>(builder: (controller) {
      return Column(
        children: [
          const SizedBox(height: 20),
          AboutItem(title: "Event title", text: controller.eventTitle),
          AboutItem(title: "Event start date", text: controller.startDat),
          AboutItem(title: "Event end date", text: controller.endDate),
          const AboutItem(title: "Member number", text: "5"),
          const SizedBox(height: 20),
          Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: controller.image == null
                  ? const Center(child: CircularProgressIndicator())
                  : Image.network(
                      controller.image!,
                      fit: BoxFit.cover,
                    )),
          const SizedBox(
            height: 20,
          ),
          const MessageText()
        ],
      );
    });
  }
}
