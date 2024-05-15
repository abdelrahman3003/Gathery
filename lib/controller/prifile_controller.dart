import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/model/user_model.dart';

abstract class ProfileControoler extends GetxController {
  Future<void> pickImage();
  getData();
}

class ProfileControolerImp extends ProfileControoler {
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  final ImagePicker imgpicker = ImagePicker();
  String? imagePath;
   UserModel? userModel;
  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await getData();
    super.onInit();
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
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email',
                  isEqualTo: appServices.sharedPreferences.getString("id"))
              .get();

      statusRequest = handlingApiData(querySnapshot);

      if (statusRequest == StatusRequest.success) {
        print("================================= fal");
        //   print("========================== 1");
        if (querySnapshot.docs.isNotEmpty) {
          print(
              "======================== count ${querySnapshot.docs.first['following']}");
          userModel = UserModel(
            email: querySnapshot.docs.first['email'] ?? "",
            name: querySnapshot.docs.first['name'] ?? "",
            follower: querySnapshot.docs.first['follower'] ?? 0,
            following: querySnapshot.docs.first['following'] ?? 0,
            leader: querySnapshot.docs.first['leader'] ?? 0,
            participant: querySnapshot.docs.first['participant'] ?? 0,
          );
          print(
              "========================== 2 ${querySnapshot.docs.first['email']}");
        } else {
          print("========================== 3");
        }
      }
      update();
    } catch (error) {
      print('Error getting tasks: $error');
    }
    update();
  }
}
