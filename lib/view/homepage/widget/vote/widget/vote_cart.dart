import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/vote/Vote_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/shared/app_button.dart';
import 'package:get/get.dart';

class VoteCart extends StatelessWidget {
  const VoteCart(
      {super.key,
      required this.nuVote,
      required this.option,
      required this.index});
  final int nuVote;
  final int index;
  final String option;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoteControllerImp>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.primary,
        ),
        child: Column(
          children: [
            Text(
              option,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      flex: controller.votes![index],
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(nuVote != 0 ? 16 : 0),
                              bottomRight:
                                  Radius.circular(nuVote != 0 ? 16 : 0),
                              topLeft: const Radius.circular(16),
                              bottomLeft: const Radius.circular(16)),
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: controller.totalaVote! - controller.votes![index],
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(nuVote == 0 ? 16 : 0),
                              bottomLeft: Radius.circular(nuVote == 0 ? 16 : 0),
                              topRight: const Radius.circular(16),
                              bottomRight: const Radius.circular(16)),
                          color: AppColor.secondry,
                        ),
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.third),
                    child: Text(
                      "$nuVote",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            controller.isVote
                ? const SizedBox()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.third,
                    ),
                    child: AppButton(
                      name: "Vote",
                      onPressed: () {
                        controller.onVote(index);
                      },
                      textColor: AppColor.primary,
                    ))
          ],
        ),
      );
    });
  }
}
