import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileControoler extends GetxController {
  Future<void> pickImage();
}

class ProfileControolerImp extends ProfileControoler {
  final ImagePicker imgpicker = ImagePicker();
  String? imagePath;
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
