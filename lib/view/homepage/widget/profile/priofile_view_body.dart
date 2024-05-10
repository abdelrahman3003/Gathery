import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/view/homepage/widget/profile/email_address_Section.dart';
import 'package:note_app/view/homepage/widget/profile/flowing_section.dart';
import 'package:note_app/view/homepage/widget/profile/image_profile.dart';
import 'package:note_app/view/homepage/widget/profile/role_information_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ImageProfile(),
            const SizedBox(height: 20),
            Text(
              "Name",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const FollowingSection(followers: "144", following: "200"),
            const SizedBox(height: 30),
            const Align(
                alignment: Alignment.topLeft,
                child: EmailAddressSection(email: "Abdelrahman30@gmail.com")),
            const SizedBox(height: 30),
            RoleInformationSection()
          ],
        ),
      ),
    );
  }
}
