import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/vote/vote_controller.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/view/homepage/widget/vote/widget/vote_cart.dart';

class VotesView extends StatelessWidget {
  const VotesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VoteControllerImp());
    return GetBuilder<VoteControllerImp>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: controller.statusRequest != StatusRequest.loading
                ? controller.votes.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.votes.length,
                        itemBuilder: (context, index) {
                          return VoteCart(
                            voteIndex: index,
                            userName: controller.votes[index]['user'],
                            voteName: controller.votes[index]['title'],
                            date: controller.votes[index]['date'] ??
                                Timestamp.now(),
                            options: controller.votes[index]['options'],
                          );
                        },
                      )
                    : const Center(child: Text("No Votes Found"))
                : const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
