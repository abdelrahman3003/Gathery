import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChatController extends GetxController {
  onSwitch(bool val);
  sendMessage();
}

class ChatControllerImp extends ChatController {
  bool isSwitch = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  onSwitch(bool val) {
    isSwitch = val;
    update();
  }

  @override
  sendMessage() {
    String message = textEditingController.text.trim();
    if (message.isNotEmpty) {
      // Send message logic here
      print('Sending message: $message');
      textEditingController.clear();
    }
  }
}
