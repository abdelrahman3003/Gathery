import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controller/join_event_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/constatnt/crud.dart';
import 'package:note_app/core/constatnt/picked_image.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/event/events_data.dart';

abstract class CeateEventController extends GetxController {
  Future<void> selectStartDate(BuildContext context);
  Future<void> selectEndDate(BuildContext context);
  Future<void> pickImage();
  selectImage();
  safeData();
  onSecure();
  getDecumentid();
}

class CeateEventControllerImp extends CeateEventController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AppServices appServices = Get.find();
  Crud crud = Crud();
  StatusRequest statusRequest = StatusRequest.none;
  bool isSecurePassword = true;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingSatrtDateController =
      TextEditingController();
  TextEditingController textEditingEndDateController = TextEditingController();
  TextEditingController textEditingPassordController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // JoinEventController joinEventController = Get.put(JoinEventControllerImp());
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
  selectImage() async {
    image = await pickedImage(ImageSource.gallery);
    update();
  }

  @override
  safeData() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      EventsData eventsData = EventsData(Get.find());
      statusRequest = await eventsData.safeData(
          title: textEditingTitleController.text,
          admin: appServices.sharedPreferences.getString("id")!,
          endDate: textEditingEndDateController.text,
          startDate: textEditingSatrtDateController.text,
          image: image,
          members: [appServices.sharedPreferences.getString("id")!],
          password: textEditingPassordController.text);
      print("=======================");

      if (statusRequest == StatusRequest.success) {
        // await joinEventController.changePage();
        Get.offAllNamed(kJoinEventView);
        Get.rawSnackbar(
            title: "Sucess",
            backgroundColor: Colors.grey,
            messageText: const Text(
              "now you is event admin",
              style: TextStyle(color: AppColor.white),
            ));
        appServices.sharedPreferences
            .setString("event", textEditingTitleController.text);
        await getDecumentid();
      } else if (statusRequest == StatusRequest.failure) {
        Get.defaultDialog(
          title: "error",
          middleText: "change this image",
        );
        update();
      } else {
        Get.defaultDialog(
          title: "error",
          middleText: "invalid data",
        );
        update();
      }
      update();
    }
  }

  @override
  onSecure() {
    isSecurePassword = !isSecurePassword;
    update();
  }

  @override
  getDecumentid() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('Events')
        .where('title', isEqualTo: textEditingTitleController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var docid = querySnapshot.docs.first.id.toString();
      await appServices.sharedPreferences.remove('docid');

      appServices.sharedPreferences.setString('docid', docid);
    }
  }
}
