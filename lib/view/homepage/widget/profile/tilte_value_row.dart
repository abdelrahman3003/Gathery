import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TilteValueRow extends StatelessWidget {
  const TilteValueRow({super.key, required this.tilte, required this.value});
  final String tilte;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$tilte  ",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
