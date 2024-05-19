import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/vote/add_vote_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/constatnt/validation.dart';
import 'package:get/get.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVoteControllerImp>(builder: (contrller) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contrller.optionControllers.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            controller: contrller.optionControllers[index],
            decoration: InputDecoration(
              hintText: "Enter option name",
              fillColor: AppColor.third,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.third, width: 1.3.h),
                  borderRadius: BorderRadius.circular(25)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.third, width: 1.3.h),
                  borderRadius: BorderRadius.circular(250)),
            ),
            validator: (val) {
              return validation(type: "Username", val: val!);
            },
          ),
        ),
      );
    });
  }
}
