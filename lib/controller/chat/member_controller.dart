import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

abstract class MembersController extends GetxController {
  getMembers();
  removeMember(int index);
 
}

class MembersControllerIMp extends MembersController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List memberList = [];
  List<bool> isAdminList = [];
  bool isClosed = false;
  @override
  void onInit() {
    getMembers();

    super.onInit();
  }

  @override
  getMembers() async {
    statusRequest = StatusRequest.loading;
    update();
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('Events')
            .where('title',
                isEqualTo: appServices.sharedPreferences.getString("event"))
            .get();

    if (querySnapshot.docs.isNotEmpty) {
      print("================= not empty");
      Map data = querySnapshot.docs.first.data() as Map;
      for (var i in data['members']) {
        memberList.add(i);
        if (i == appServices.sharedPreferences.getString("id")) {
          isAdminList.add(true);
        } else {
          isAdminList.add(false);
        }
      }
      statusRequest = StatusRequest.success;
      update();
    } else {
      print("=================  empty");
    }

    update();
  }

  @override
  removeMember(int index) async {
    if (memberList[index] != appServices.sharedPreferences.getString("id")) {
      memberList.removeAt(index);
      update();
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          title: "this member removed successfully",
          messageText: const Text(""));

      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await _firestore
          .collection("Events")
          .where("title",
              isEqualTo: appServices.sharedPreferences.getString("event"))
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.update({
          "members": memberList,
        });
        print("======================= member is not empty");
      } else {
        print("======================= member is  empty");
      }

      print('String removed successfully');

      update();
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          title: "cant't remove user , this is admin",
          messageText: const Text(""));
    }
  }

 
}
