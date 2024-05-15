import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/prifile_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/view/homepage/widget/profile/tilte_value_row.dart';

class RoleInformationSection extends GetView<ProfileControolerImp> {
  const RoleInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Role Information : ",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(right: 35),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
              color: AppColor.third, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              TilteValueRow(
                  tilte: "Event Leader",
                  value: "${controller.userModel!.leader}"),
              TilteValueRow(
                  tilte: "Participant",
                  value: "${controller.userModel!.participant}"),
              TilteValueRow(tilte: "Funding Supporter", value: "0"),
            ],
          ),
        ),
      ],
    );
  }
}
