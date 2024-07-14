import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/vote/vote_controller.dart';
import 'package:note_app/view/homepage/widget/vote/widget/user_vote_section.dart';
import 'package:note_app/view/homepage/widget/vote/widget/option_cart.dart';

class VoteCart extends GetView<VoteControllerImp> {
  const VoteCart(
      {super.key,
      required this.userName,
      required this.voteName,
      required this.options,
      required this.voteIndex,
      required this.date});
  final String userName;
  final String voteName;
  final Timestamp date;
  final List options;
  final int voteIndex;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      UserVoteNameSection(userName: userName, voteName: voteName, date: date),
      ListView.builder(
        itemCount: options.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => OptionCart(
          onVote: () {
            controller.onVote(title: voteName,option: index,voteNum: voteIndex);
            controller.changeindex(voteIndex, index);
          },
          index: voteIndex,
          option: index,
          percent: options[index]['percent'],
          answer: options[index]['answer'],
          isVoted: controller.allVoters[voteIndex].contains(
                  controller.appServices.sharedPreferences.getString("id"))
              ? false
              : true,
        ),
      ),
      const SizedBox(height: 30)
    ]);
  }
}
