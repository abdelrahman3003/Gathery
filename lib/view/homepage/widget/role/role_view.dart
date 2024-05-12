import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/routApp.dart';

class RoleView extends StatelessWidget {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const TextRole(text: "Invite participants"),
            const TextRole(text: "Invite by link"),
            const TextRole(text: "Manage chat"),
            const TextRole(text: "Lock chat"),
            const TextRole(text: "kick particpants"),
            GestureDetector(
              onTap: () {
                Get.offNamed(kJoinEventView);
              },
              child: const Text("Create or join event",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}

class TextRole extends StatelessWidget {
  const TextRole({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text("= $text",
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}
