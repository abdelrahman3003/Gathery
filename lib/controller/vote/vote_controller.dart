import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/button_navigator_bar_controller.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/homepage/buttom_navigator_bar.dart';

abstract class VoteController extends GetxController {
  onVote({required String title, required int option, required int voteNum});
  getTotalVotes();
  checkUserVoted(String title);
  changeindex(int option, int index);
}

class VoteControllerImp extends VoteController {
  List<QueryDocumentSnapshot> votes = [];
  CollectionReference voteCollection =
      FirebaseFirestore.instance.collection('votes');
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequestvote = StatusRequest.none;
  AppServices appServices = Get.find();
  ButtonNavigatorBarControllerImp buttonNavigatorBarControllerImp =
      ButtonNavigatorBarControllerImp();
  List<List> allVoters = [];
  List<bool> isvotedList = [false, false, false, false, false];

  int? index;
  int? option;
  @override
  void onInit() {
    getTotalVotes();
    super.onInit();
  }

  @override
  onVote(
      {required String title,
      required int option,
      required int voteNum}) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
          await voteCollection.where("title", isEqualTo: title).get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;
      await docRef.update({
        'voters': FieldValue.arrayUnion(
            [appServices.sharedPreferences.getString("id")])
      });
      await firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(docRef);
        List<dynamic> listOfMaps =
            await snapshot.get('options') as List<dynamic>;

        for (var map in listOfMaps) {
          if (map['id'] == option) {
            await map['percent']++;
            break;
          }
        }

        transaction.update(docRef, {'options': listOfMaps});
      });
      Get.offAllNamed(kBottomNavigationScreen, arguments: {"index": 2});
    } catch (e) {
    }
    update();
  }

  @override
  getTotalVotes() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      await voteCollection
          .orderBy('date', descending: true)
          .get()
          .then((value) {
        if (value.docs.isEmpty) {
          votes = [];
        } else {
          final data = value.docs;
          for (var i in data) {
            if (i.get("event") ==
                appServices.sharedPreferences.getString("event")) {
              votes.add(i);
            }
            allVoters.add(i['voters']);
          }
        }
        update();
        statusRequest = StatusRequest.success;
      });
    } catch (e) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  checkUserVoted(String title) async {
    try {
      QuerySnapshot querySnapshot =
          await voteCollection.where("title", isEqualTo: title).get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception("Document not found!");
      }

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      List<dynamic> voters = documentSnapshot.get('voters') as List<dynamic>;

      // Check if the user's ID is in the list of voters
      return voters.contains(
        appServices.sharedPreferences.getString("id"),
      );
    } catch (e) {
      return false;
    }
  }

  @override
  changeindex(int option, int index) {
    index = index;
    option = option;
    update();
  }
}
