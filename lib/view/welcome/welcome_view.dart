import 'package:flutter/material.dart';
import 'package:note_app/core/constatnt/app_color.dart';
import 'package:note_app/view/welcome/widget/welcome_View_Body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primary,
      body: WelcomeViewBody(),
    );
  }
}
