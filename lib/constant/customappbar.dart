import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});
  final String title;
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
