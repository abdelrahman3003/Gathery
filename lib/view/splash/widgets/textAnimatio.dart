import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.slidinganmation,
  });

  final Animation<Offset> slidinganmation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganmation,
      builder: (context, _) {
        return SlideTransition(
          position: slidinganmation,
          child: Text(
            "Gatherly",
            style: GoogleFonts.kavoon(
              textStyle: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
