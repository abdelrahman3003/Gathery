import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/controller/chat/chat_controller.dart';

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

                  bool isMe = messageUserId == chatController.id;

                  return ListTile(
                    title: Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[200] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              messageText,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              messageUserId,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
