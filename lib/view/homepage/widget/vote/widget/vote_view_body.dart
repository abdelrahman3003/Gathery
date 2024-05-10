import 'package:flutter/material.dart';
import 'package:note_app/controller/vote/Vote_controller.dart';
import 'package:note_app/view/homepage/widget/vote/widget/user_vote_section.dart';

import 'package:note_app/view/homepage/widget/vote/widget/vote_list.dart';
import 'package:get/get.dart';

class VoteViewBody extends StatelessWidget {
  const VoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoteControllerImp>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            UserVoteNameSection(
                userName: "the user name",
                voteName: "the vote name",
                date: DateTime.now().toString()),
            const VotesList(),
            const SizedBox(height: 30)
          ]),
        ),
      );
    });
  }
}
