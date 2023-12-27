import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom(
      {super.key,
      required this.backgroundcolor,
      required this.textcolor,
      required this.text,
      this.borderRadius,
      required this.onPressed,
      this.width = 1.0});
  final Color backgroundcolor;
  final Color textcolor;
  final Function()? onPressed;
  BorderRadius? borderRadius;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width * width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
