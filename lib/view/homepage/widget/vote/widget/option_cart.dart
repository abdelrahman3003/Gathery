import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/vote/vote_controller.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/core/shared/app_button.dart';

class OptionCart extends GetView<VoteControllerImp> {
  const OptionCart({
    super.key,
    required this.percent,
    required this.answer,
    this.isVoted = false,
    this.onVote,
    required this.voteIndex,
  });
  final int percent;
  final void Function()? onVote;
  final String answer;
  final bool isVoted;
  final int voteIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.primary,
        ),
        child: Column(
          children: [
            Text(answer,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      flex: percent,
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(percent != 0 ? 16 : 0),
                              bottomRight:
                                  Radius.circular(percent != 0 ? 16 : 0),
                              topLeft: const Radius.circular(16),
                              bottomLeft: const Radius.circular(16)),
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: controller.allVoters[voteIndex].length - percent,
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(percent == 0 ? 16 : 0),
                              bottomLeft:
                                  Radius.circular(percent == 0 ? 16 : 0),
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
                      "$percent",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.third,
                ),
                child: AppButton(
                  name: "Vote",
                  onPressed: onVote,
                  textColor: AppColor.primary,
                ))
          ],
        ),
      ),
    );
  }
}
