import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/model/event_model.dart';

abstract class ChatController extends GetxController {
  sendMessage();
  Stream<QuerySnapshot> getChatStream();
  getDataGroub();
}

class ChatControllerImp extends ChatController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  AppServices appServices = Get.find();
  String? id;

  EventModel? eventModel;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    getDataGroub();
    super.onInit();
  }

  @override
  Stream<QuerySnapshot> getChatStream() {
    return firestore
        .collection('chats')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      firestore.collection('chats').add({
        'text': messageController.text,
        'createdAt': Timestamp.now(),
        'userId': id
      });
      messageController.clear();
    }
  }

  @override
  getDataGroub() async {
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
      eventModel = EventModel(
          title: querySnapshot.docs.first['title'],
          admin: querySnapshot.docs.first['admin'],
          startDate: querySnapshot.docs.first['start_date'],
          endDate: querySnapshot.docs.first['end_date'],
          image: querySnapshot.docs.first['image'],
          members: querySnapshot.docs.first['members']);
      statusRequest = StatusRequest.success;
      
      update();
    } else {
      print("=================  empty");
      print(
          "=================  ${appServices.sharedPreferences.getString("event")}");
    }

    update();
  }
}
