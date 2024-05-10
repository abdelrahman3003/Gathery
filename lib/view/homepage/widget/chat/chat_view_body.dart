import 'package:flutter/material.dart';
import 'package:note_app/view/homepage/widget/chat/bottom_chat_text_field.dart';
import 'package:note_app/view/homepage/widget/chat/chat_message.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: const [
                ChatMessage(
                  message: 'Hello!',
                  isSentByMe: true,
                ),
                ChatMessage(
                  message: 'Hi there!',
                  isSentByMe: false,
                ),
                ChatMessage(
                  message: 'Hi there!',
                  isSentByMe: true,
                ),
                ChatMessage(
                  message: 'Hi there!',
                  isSentByMe: false,
                ),
                ChatMessage(
                  message: 'Hi there!',
                  isSentByMe: false,
                ),

                // Add more messages here
              ],
            ),
          ),
          const BottomChatTextField(),
        ],
      ),
    );
  }
}
