import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatMessage({
    super.key,
    required this.message,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: isSentByMe ? Radius.circular(10.0) : Radius.zero,
                bottomRight: !isSentByMe ? Radius.circular(10.0) : Radius.zero,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text(
              message,
              style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
