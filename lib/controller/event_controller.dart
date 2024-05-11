import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/picked_image.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/core/constatnt/upload_image.dart';
import 'package:note_app/data/event/events_data.dart';

abstract class CeateEventController extends GetxController {
  Future<void> selectStartDate(BuildContext context);
  Future<void> selectEndDate(BuildContext context);
  Future<void> pickImage();
  selectImage();
  safeData();
  Future<void> addEvent();
}

class CeateEventControllerImp extends CeateEventController {
  Crud crud = Crud();
  StatusRequest statusRequest = StatusRequest.none;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingSatrtDateController =
      TextEditingController();
  TextEditingController textEditingEndDateController = TextEditingController();

  final ImagePicker imgpicker = ImagePicker();
  String? imagePath;
  Uint8List? image;

  @override
  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: AppColor.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectStartDate) {
      selectedStartDate = picked;
    }
    textEditingSatrtDateController.text =
        "${selectedStartDate.toLocal()}".split(' ')[0];
    update();
  }

  @override
  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: AppColor.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedEndDate) {
      selectedEndDate = picked;
    }
    textEditingEndDateController.text =
        "${selectedEndDate.toLocal()}".split(' ')[0];
    update();
  }

  @override
  Future pickImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePath = pickedFile.path;
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking image.");
    }
    update();
  }

  @override
  Future<void> addEvent() async {
    if (imagePath == null) {
      Get.defaultDialog(
        title: "please download iamge",
        middleText: "",
      );
      // } else {
      //   File imageFile = File(imagePath!);
      //   String? imageUrl = await uploadImage(imageFile);
      //   if (imageUrl == null) {
      //     Get.defaultDialog(
      //       title: "error",
      //       middleText: "this image not valid",
      //     );
      //   } else {
      //     statusRequest = StatusRequest.loading;
      //     statusRequest = await crud.postData('events', {
      //       'title': textEditingTitleController.text,
      //       'start event': textEditingSatrtDateController.text,
      //       'end event': textEditingEndDateController.text,
      //       'imageUrl': imageUrl,
      //     });
      //     if (statusRequest == StatusRequest.success) {
      //       Get.toNamed(kBottomNavigationScreen);
      //     } else {
      //       Get.defaultDialog(
      //         title: "in valid details",
      //         middleText: "",
      //       );
      //     }
      //   }
    }
  }

  @override
  selectImage() async {
    image = await pickedImage(ImageSource.gallery);
    update();
  }

  @override
  safeData() async {
    statusRequest = StatusRequest.loading;
    update();
    EventsData eventsData = EventsData();
    statusRequest = await eventsData.safeData(
      textEditingTitleController.text,
      textEditingSatrtDateController.text,
      textEditingEndDateController.text,
      image!,
    );
    if (statusRequest == StatusRequest.success) {
      Get.toNamed(kBottomNavigationScreen);
    } else {
      Get.defaultDialog(
        title: "error",
        middleText: "invalid details",
      );
      update();
    }
    update();
  }
}
