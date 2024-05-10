import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/view/homepage/widget/home/about_item.dart';
import 'package:note_app/view/homepage/widget/home/messages_text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const AboutItem(title: "Event title", text: "Event Name"),
        const AboutItem(title: "Event start date", text: "4-5-2024"),
        const AboutItem(title: "Event end date", text: "10-5-2024"),
        const AboutItem(title: "Member number", text: "5"),
        const SizedBox(height: 20),
        Container(
          height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            "assets/images/test1.png",
            fit: BoxFit.cover,
          ),
        ),
        const MessageText()
      ],
    );
  }
}
