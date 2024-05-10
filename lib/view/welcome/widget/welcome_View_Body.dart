import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/routApp.dart';
import 'package:note_app/core/shared/app_button.dart';
import 'package:get/get.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 7),
          Text(
            "Welcome to note_app ",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            "an app for managing and organizing your events  ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          const Spacer(flex: 3),
          Center(
              child: Container(
                  width: 260.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.secondry,
                  ),
                  child: AppButton(
                    name: "Log in ",
                    onPressed: () {
                      Get.toNamed(kSignInView);
                    },
                  ))),
          const SizedBox(height: 16),
          Center(
              child: Container(
                  width: 260.w,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.secondry,
                  ),
                  child: AppButton(
                    name: "Sign up ",
                    onPressed: () {
                      Get.toNamed(kSignUpView);
                    },
                  ))),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
