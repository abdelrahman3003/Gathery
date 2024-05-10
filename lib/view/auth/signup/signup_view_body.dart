import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/constatnt/app_color.dart';
import '../../../core/constatnt/validation.dart';
import '../../../core/shared/app_button.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 4),
              Text("Sign up  ",
                  style:
                      TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold)),
              Text("fill this information",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w200)),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  hintText: "Full name ",
                  prefixIcon: const Icon(Icons.person),
                  fillColor: AppColor.third,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(25)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(250)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(250)),
                ),
                validator: (val) {
                  return validation(type: "Username", val: val!);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  prefixIcon: const Icon(Icons.email),
                  fillColor: AppColor.third,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(25)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(250)),
                ),
                validator: (val) {
                  return validation(type: "Email", val: val!);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.password),
                  fillColor: AppColor.third,
                  suffixIcon: InkWell(
                    onTap: controller.onScure,
                    child: controller.isScurePassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(25)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.third, width: 1.3.h),
                      borderRadius: BorderRadius.circular(250)),
                ),
                obscureText: controller.isScurePassword,
                validator: (val) {
                  return validation(type: "Password", val: val!);
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.secondry,
                    ),
                    child: AppButton(
                      name: "Sign Up",
                      onPressed: controller.signUp,
                    )),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      );
    });
  }
}
