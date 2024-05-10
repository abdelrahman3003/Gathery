import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/view/homepage/widget/profile/tilte_value_row.dart';

class RoleInformationSection extends StatelessWidget {
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
          child: const Column(
            children: [
              TilteValueRow(tilte: "Event Leader", value: "4"),
              TilteValueRow(tilte: "Participant", value: "2"),
              TilteValueRow(tilte: "Funding Supporter", value: "3"),
            ],
          ),
        ),
      ],
    );
  }
}
