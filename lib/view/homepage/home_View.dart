import 'package:flutter/material.dart';
import 'package:note_app/view/homepage/widget/home/about.dart';
import 'package:note_app/view/homepage/widget/home/tasks_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(child: About())),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TasksView(),
      )
    ]);
  }
}
