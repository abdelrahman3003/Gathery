
import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class CeateEventController extends GetxController {

  Future<void> selectStartDate(BuildContext context);
  Future<void> selectEndDate(BuildContext context);
  Future<void> pickImage();
}

class CeateEventControllerImp extends CeateEventController {

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingSatrtDateController =
      TextEditingController();
  TextEditingController textEditingEndDateController = TextEditingController();
  
  final ImagePicker imgpicker = ImagePicker();
  String? imagePath;


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
}
