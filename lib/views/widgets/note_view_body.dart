import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/customappbar.dart';
import 'package:note_app/views/widgets/note.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Note(),
        ),
      ],
    );
  }
}
