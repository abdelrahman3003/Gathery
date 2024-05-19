import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constatnt/services.dart';
import 'package:note_app/core/constatnt/statuscode.dart';

abstract class VoteController extends GetxController {
  onVote(String title, int option,int voteNum);
  getTotalVotes();
  checkUserVoted(String title);
}

class VoteControllerImp extends VoteController {
  List<QueryDocumentSnapshot> votes = [];
  CollectionReference voteCollection =
      FirebaseFirestore.instance.collection('votes');
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  List<List> allVoters = [];
  List<bool> isvotedList = [false, false, false, false, false];
  @override
  void onInit() {
    getTotalVotes();
    super.onInit();
  }

  @override
  onVote(String title, int option ,int voteNum) async {
    try {
      if (allVoters[voteNum]
          .contains(appServices.sharedPreferences.getString("id"))) {
        print("================else");
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            title: "You voted already",
            messageText: const Text(""));
      } else {
        statusRequest = StatusRequest.loading;
        update();
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        QuerySnapshot querySnapshot =
            await voteCollection.where("title", isEqualTo: title).get();

        if (querySnapshot.docs.isEmpty) {
          throw Exception("Document not found!");
        }

        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        DocumentReference docRef = documentSnapshot.reference;
        await docRef.update({
          'voters': FieldValue.arrayUnion(
              [appServices.sharedPreferences.getString("id")])
        });
        await firestore.runTransaction((transaction) async {
          DocumentSnapshot snapshot = await transaction.get(docRef);

          if (!snapshot.exists) {
            statusRequest = StatusRequest.failure;
          }

          List<dynamic> listOfMaps = snapshot.get('options') as List<dynamic>;

          // Find the map with the specified mapId and update its value
          for (var map in listOfMaps) {
            if (map['id'] == option) {
              print("increament====================");
              map['percent']++;
              // Update the value within the map
              break;
            }
          }
          getTotalVotes();
          // Updadete the document with the modified list
          transaction.update(docRef, {'options': listOfMaps});
        });
      }

      print('Value in list of maps updated successfully');
    } catch (e) {
      print('================ Error updating value in list of maps: $e');
    }
    update();
  }

  @override
  getTotalVotes() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      await voteCollection.get().then((value) {
        if (value.docs.isEmpty) {
          votes = [];
        } else {
          final data = value.docs;
          for (var i in data) {
            if (i.get("event") ==
                appServices.sharedPreferences.getString("event")) {
              votes = data;
            }
            allVoters.add(i['voters']);
            print("=============== voters ${allVoters.length}");
          }
          print("=============== voters in one ${allVoters[1].length}");

          print("=========== lenght ${data.length}");
        }

        statusRequest = StatusRequest.success;
      });
    } catch (e) {
      print("======================$e");
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
      print('Error checking if user has voted: $e');
      return false;
    }
  }
}
