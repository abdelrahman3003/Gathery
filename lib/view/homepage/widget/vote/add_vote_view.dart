import 'package:flutter/material.dart';
import 'package:note_app/controller/vote/add_vote_controller.dart';
import 'package:note_app/view/homepage/widget/bottom_navigate/costom_appbar.dart';
import 'package:note_app/view/homepage/widget/vote/widget/add_vote_view_body.dart';
import 'package:get/get.dart';

class AddVoteView extends StatelessWidget {
  const AddVoteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddVoteControllerImp());
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(title: " Voting"),
      ),
      body: AddVoteViewBody(),
    );
  }
}
