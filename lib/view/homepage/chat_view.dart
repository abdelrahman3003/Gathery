import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/view/homepage/widget/chat/chat_appbar.dart';
import 'package:note_app/view/homepage/widget/chat/chat_view_body.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h), child: const ChatAppbar()),
      body: const ChatViewBody(),
    );
  }
}
