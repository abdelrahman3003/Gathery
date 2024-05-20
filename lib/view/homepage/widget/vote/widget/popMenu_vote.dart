import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:get/get.dart';

class PopmenuVote extends StatelessWidget {
  const PopmenuVote({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(value: 'add vote', child: Text("add vote")),
        ];
      },
      onSelected: (String value) {
        Get.offNamed(kAddVoteView);
      },
    );
  }
}
