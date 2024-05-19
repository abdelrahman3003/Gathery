import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/vote/add_vote_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/statuscode.dart';
import 'package:note_app/core/constatnt/validation.dart';
import 'package:note_app/view/homepage/widget/vote/widget/option_list.dart';
import 'package:note_app/view/homepage/widget/vote/widget/title_text_vote.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../core/shared/app_button.dart';

class AddVoteViewBody extends StatelessWidget {
  const AddVoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVoteControllerImp>(
        dispose: (state) => Get.delete<AddVoteControllerImp>(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    const TitleTextVote(title: "Vote Title"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: controller.titleController,
                        decoration: InputDecoration(
                          hintText: "Enter vote tilte",
                          fillColor: AppColor.third,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.third, width: 1.3.h),
                              borderRadius: BorderRadius.circular(25)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.third, width: 1.3.h),
                              borderRadius: BorderRadius.circular(250)),
                        ),
                        validator: (val) {
                          return validation(type: "Username", val: val!);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TitleTextVote(title: "Vote Option"),
                    const SizedBox(height: 10),
                    const OptionsList(),
                    const SizedBox(height: 20),
                    Center(
                        child: InkWell(
                      onTap: () {
                        controller.addOption();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.h, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColor.third,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.primary,
                        ),
                      ),
                    )),
                    const SizedBox(height: 20),
                    Center(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.secondry,
                      ),
                      child: controller.statusRequest != StatusRequest.loading
                          ? AppButton(
                              name: "add vote",
                              onPressed: () {
                                controller.addvoting();
                              })
                          : const CircularProgressIndicator(),
                    )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
