import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/view/homepage/widget/chat/chat_message.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatControllerImp chatController = Get.put(ChatControllerImp());
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: chatController.getChatStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final messages = snapshot.data!.docs;

              return ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  var messageData =
                      messages[index].data() as Map<String, dynamic>;
                  var messageText = messageData['text'];
                  var messageUserId = messageData['userId'];

                  bool isMe = messageUserId ==
                      chatController.appServices.sharedPreferences.get("id");

                  return ChatMessage(
                    message: messageText,
                    isSentByMe: isMe,
                    user: messageUserId,
                  );
                },
              );
            },
          ),
        ),
        GetBuilder<ChatControllerImp>(builder: (controlller) {
          return controlller.checkClosed()
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: chatController.messageController,
                          decoration: const InputDecoration(
                            labelText: 'Send a message...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: chatController.sendMessage,
                      ),
                    ],
                  ))
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Center(
                      child: Text(
                    "admin closed this chat",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                );
        }),
      ],
    );
  }
}
