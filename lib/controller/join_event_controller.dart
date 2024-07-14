import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/handling%20_data.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/data/dataSource/remote/event/events_data.dart';
import 'package:note_app/data/dataSource/remote/event/join_event_data.dart';

abstract class JoinEventController extends GetxController {
  changePage();
  securePassword();
  join();
  addUser();
  checkAdmin();
  getMebers();
  getUser();
  getDecumentid();
}

class JoinEventControllerImp extends JoinEventController {
  late final GlobalKey<FormState> formKey;
  bool isJoined = true;
  bool isScurePassword = true;
  bool test = true;
  JoinEvent joinEvent = JoinEvent(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  EventsData eventsData = EventsData(Get.find());
  TextEditingController textEditingTitlController = TextEditingController();
  TextEditingController textEditingPasswordController = TextEditingController();
  List<String> members = [];
  StatusRequest statusRequest1 = StatusRequest.none;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String name = "";

  @override
  changePage() {
    isJoined = !isJoined;
    update();
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    super.onInit();
    getUser();
  }

  @override
  securePassword() {
    isScurePassword = !isScurePassword;
    update();
  }

  @override
  join() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await joinEvent.join(
        title: textEditingTitlController.text,
        password: textEditingPasswordController.text,
      );

      statusRequest = handlingApiData(response);

      if (statusRequest == StatusRequest.success) {
        CollectionReference collectionReference = response;
        QuerySnapshot querySnapshot = await collectionReference
            .where('title', isEqualTo: textEditingTitlController.text)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          if (querySnapshot.docs.first['password'] ==
              textEditingPasswordController.text) {
            await getDecumentid();
            appServices.sharedPreferences
                .setString("event", textEditingTitlController.text);
            appServices.sharedPreferences.setInt("index", 0);
            await checkAdmin();
            await addUser();
            Get.rawSnackbar(
                title: "Sucess",
                backgroundColor: Colors.grey,
                messageText: const Text(
                  "now you is event admin",
                  style: TextStyle(color: AppColor.white),
                ));
            appServices.sharedPreferences.setString('step', '2');
            Get.offAllNamed(kBottomNavigationScreen,
                arguments: {'title': textEditingTitlController.text});
          } else {
            statusRequest = StatusRequest.failure;

            Get.defaultDialog(
              title: "error",
              middleText: "incorrect password",
            );
          }
        } else {
          Get.defaultDialog(
            title: "error",
            middleText: "this event is not found",
          );
          statusRequest = StatusRequest.failure;
        }
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
  addUser() async {
    statusRequest = StatusRequest.loading;
    try {
      // Query for the document with the matching title
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Events')
          .where('title', isEqualTo: textEditingTitlController.text)
          .get();

      // Check if the document exists
      if (querySnapshot.docs.isNotEmpty) {
        // Get the reference to the document
        DocumentReference docRef = querySnapshot.docs.first.reference;

        // Update the document
        await docRef.update({
          'members': FieldValue.arrayUnion(
              [appServices.sharedPreferences.getString("id")])
        });
      } else {
        print('Document with title "title" not found');
      }
    } catch (e) {
      print('Error adding item to list: $e');
    }
  }

  @override
  checkAdmin() async {
    print("================ check admin");
    try {
      // Query for the document with the matching title
      var user = appServices.sharedPreferences.getString("id");
      print("=================== $user");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Events')
          .where("admin", isEqualTo: user)
          .get();

      // Check if the document exists
      if (querySnapshot.docs.isNotEmpty) {
        // Get the reference to the document
        print("================ admin excute");

        await appServices.sharedPreferences.setBool("admin", true);
      } else {
        print("================ admin excute   false");
        await appServices.sharedPreferences.setBool("admin", false);
      }
      update();
    } catch (e) {
      print('Error adding item to admin email: $e');
    }
  }

  @override
  getMebers() async {
    try {
      // Query for the document with the matching title
      statusRequest1 = StatusRequest.loading;
      update();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Events') // Replace with your collection name
          .where('title',
              isEqualTo: appServices.sharedPreferences.getString("event"))
          .get();
      statusRequest1 = handlingApiData(querySnapshot);
      // Check if the document exists
      if (statusRequest1 == StatusRequest.success) {
        if (querySnapshot.docs.isNotEmpty) {
          // Get the first document from the query result
          DocumentSnapshot docSnapshot = querySnapshot.docs.first;

          // Cast the data to a Map<String, dynamic>
          Map<String, dynamic>? data =
              docSnapshot.data() as Map<String, dynamic>?;

          // Check if the data is not null and contains the list field
          if (data != null && data.containsKey('members')) {
            // Access the value of the list field
            members = List<String>.from(data['members']);
            update();
            return members;
          } else {
            print(
                'List field members not found in document with title members');
            return []; // Return an empty list if list field not found
          }
        } else {
          print('Document with title event not found');
          return []; // Return an empty list if document not found
        }
      }
      update();
    } catch (e) {
      print('Error getting items from list: $e');
      return []; // Return an empty list if there's an error
    }
  }

  @override
  getUser() async {
    statusRequest = StatusRequest.loading;
    try {
      statusRequest = StatusRequest.loading;
      update();
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email',
                  isEqualTo: appServices.sharedPreferences.getString("id"))
              .get();
      if (querySnapshot.docs.isNotEmpty) {}
      statusRequest = handlingApiData(querySnapshot);

      if (statusRequest == StatusRequest.success) {
        if (querySnapshot.docs.isNotEmpty) {
          name = querySnapshot.docs.first['name'];
          print("========================$name");
        }
      }
      update();
    } catch (error) {
      statusRequest = StatusRequest.loading;
      print('Error getting tasks: $error');
    }
    update();
  }

  @override
  getDecumentid() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('Events')
        .where('title', isEqualTo: textEditingTitlController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      print("========== join");
      var docid = querySnapshot.docs.first.id.toString();
      print("==========do2 $docid");

      await appServices.sharedPreferences.setString('docid', docid);
    }
  }
}
