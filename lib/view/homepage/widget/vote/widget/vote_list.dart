import 'package:flutter/material.dart';
import 'package:note_app/controller/vote/Vote_controller.dart';
import 'package:note_app/view/homepage/widget/vote/widget/vote_cart.dart';
import 'package:get/get.dart';

class VotesList extends StatelessWidget {
  const VotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoteControllerImp>(builder: (controller) {
      return ListView.builder(
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => VoteCart(
            index: index,
            nuVote: controller.votes![index],
            option: "option ${index + 1}"),
      );
    });
  }
}
