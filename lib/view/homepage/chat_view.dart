import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/homepage/widget/chat/chat_appbar.dart';
import 'package:note_app/view/homepage/widget/chat/chat_view_body.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
    return GetBuilder<ChatControllerImp>(builder: (controller) {
      return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: controller.statusRequest != StatusRequest.loading
                  ? const ChatAppbar()
                  : const SizedBox()),
          body: const ChatViewBody());
    });
  }
}
