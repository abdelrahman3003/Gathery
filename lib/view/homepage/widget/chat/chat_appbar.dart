import 'package:flutter/material.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';

class ChatAppbar extends GetView<ChatControllerImp> {
  const ChatAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary, // WhatsApp's green color
    
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.eventModel!.title, // Replace with the contact's name
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${controller.eventModel!.members.length} Members', // Replace with the contact's name
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'view_contact',
                child: Text('View Contact'),
              ),
              PopupMenuItem<String>(
                value: 'Chating',
                child: Row(
                  children: [
                    const Expanded(child: Text('Chtting')),
                    GetBuilder<ChatControllerImp>(builder: (controller) {
                      return Switch(
                        value: true,
                        onChanged: (newValue) {},
                        activeColor:
                            AppColor.primary, // Customize the active color
                        activeTrackColor: AppColor
                            .third, // Customize the track color when active
                        inactiveThumbColor: Colors
                            .grey, // Customize the color of the switch thumb when inactive
                        inactiveTrackColor: Colors.grey[
                            300], // Customize the color of the switch track when inactive
                      );
                    })
                  ],
                ),
              ),

              // Add more options as needed
            ];
          },
          onSelected: (String value) {
            // Handle menu item selection
          },
        ),
      ],
    );
  }
}
