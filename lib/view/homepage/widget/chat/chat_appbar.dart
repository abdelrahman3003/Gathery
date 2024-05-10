import 'package:flutter/material.dart';
import 'package:note_app/controller/chat/chat_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/assets.dart';
import 'package:get/get.dart';

class ChatAppbar extends StatelessWidget {
  const ChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary, // WhatsApp's green color
      leading: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: CircleAvatar(
          backgroundImage: AssetImage(ImageAsset.test),
          // backgroundImage: NetworkImage(
          //     'https://example.com/profile_picture.jpg'), // Replace with your profile picture URL
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Group Name', // Replace with the contact's name
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '3 Members', // Replace with the contact's name
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.call),
        //   onPressed: () {
        //     // Add action for calling
        //   },
        // ),
        // IconButton(
        //   icon: Icon(Icons.video_call),
        //   onPressed: () {
        //     // Add action for video calling
        //   },
        // ),
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
                        value: controller.isSwitch,
                        onChanged: (newValue) {
                          controller.onSwitch(newValue);
                        },
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
