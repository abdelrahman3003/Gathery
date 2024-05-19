import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/chat/member_controller.dart';
import 'package:note_app/view/homepage/widget/chat/member_cart.dart';

class MembersView extends StatelessWidget {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MembersControllerIMp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Members"),
          centerTitle: true,
        ),
        body: GetBuilder<MembersControllerIMp>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.memberList.length,
            itemBuilder: (context, index) => MemberCart(
                email: controller.memberList[index],
                isAdmin: controller.isAdminList[index],
                onTap: () {
                  controller.removeMember(index);
                }),
          );
        }));
  }
}
