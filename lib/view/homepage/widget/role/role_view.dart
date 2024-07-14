import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/routApp.dart';

class RoleView extends StatelessWidget {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            //   const TextRole(text: "Invite participants"),
            //     const TextRole(text: "Invite by link"),
            //   const TextRole(text: "Manage chat"),
            GetBuilder<ChatControllerImp>(builder: (controller) {
              return Row(
                children: [
                  InkWell(
                      onTap: () {
                        if (!controller.appServices.sharedPreferences
                            .getBool("admin")!) {
                          Get.rawSnackbar(
                              backgroundColor: Colors.grey,
                              title: "only admin is accessed",
                              messageText: const Text(""));
                        }
                      },
                      child: const TextRole(text: "Lock chat")),
                  const Spacer(),
                  controller.appServices.sharedPreferences.getBool("admin")!
                      ? Switch(
                          value: controller.isclosed,
                          onChanged: (newValue) {
                            controller.chatClose(newValue);
                          },
                          activeColor:
                              AppColor.primary, // Customize the active color
                          activeTrackColor: AppColor
                              .third, // Customize the track color when active
                          inactiveThumbColor: Colors
                              .grey, // Customize the color of the switch thumb when inactive
                          inactiveTrackColor: Colors.grey[
                              300], // Customize the color of the switch track when inactive
                        )
                      : const SizedBox()
                ],
              );
            }),
            InkWell(
                onTap: () {
                  if (controller.appServices.sharedPreferences
                      .getBool("admin")!) {
                    Get.toNamed(kMembersView);
                  } else {
                    Get.rawSnackbar(
                        backgroundColor: Colors.grey,
                        title: "only admin is accessed",
                        messageText: const Text(""));
                  }
                },
                child: const TextRole(text: "kick particpants")),
            GestureDetector(
              onTap: () async {
                await controller.appServices.sharedPreferences.remove('docid');

                Get.offAllNamed(kJoinEventView);
              },
              child: const Text("Create or join event",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 80),
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                  color: AppColor.white,
                ),
                child: GestureDetector(
                  onTap: controller.logOut,
                  child: const Text("Logout",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          fontWeight: FontWeight.w600)),
                ),
              ),
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
