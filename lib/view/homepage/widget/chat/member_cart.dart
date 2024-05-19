import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/app_color.dart';

class MemberCart extends StatelessWidget {
  const MemberCart({super.key, required this.email, required this.isAdmin, this.onTap});
  final String email;
  final bool isAdmin;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.third,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  isAdmin ? "admin" : "participant",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.white),
              child: const Text(
                "Remove",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
