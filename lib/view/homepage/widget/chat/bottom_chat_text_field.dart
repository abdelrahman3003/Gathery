import 'package:flutter/material.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:get/get.dart';

class BottomChatTextField extends StatelessWidget {
  const BottomChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // Handle send button pressed
                String message = controller.textEditingController.text.trim();
                if (message.isNotEmpty) {
                  // Send message logic here
                  print('Sending message: $message');
                  controller.textEditingController.clear();
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
