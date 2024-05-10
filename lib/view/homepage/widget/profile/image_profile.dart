import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/controller/prifile_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControolerImp>(builder: (controller) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.third, // Change border color here
                width: 2, // Change border width here
              ),
            ),
            child: CircleAvatar(
                radius: 50,
                backgroundColor: controller.imagePath != null
                    ? Colors.white
                    : AppColor.primary, // Background color of the circle
                child: controller.imagePath != null
                    ? Image.file(
                        File(
                          controller.imagePath!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.person,
                        size: 33,
                      )),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: InkWell(
              onTap: controller.pickImage,
              child: CircleAvatar(
                  radius: 18,
                  backgroundColor:
                      Colors.white, // Background color of the circle
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.camera_alt))),
            ),
          ),
        ],
      );
    });
  }
}
