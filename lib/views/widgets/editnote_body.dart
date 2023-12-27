import 'package:flutter/material.dart';
import 'package:note_app/constant/customappbar.dart';
import 'package:note_app/views/widgets/show_button_sheet.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomAppbar(
            icon: Icons.check,
            onPressed: () {},
            title: "Edite Note",
          ),
        ),
        ShowButtonSheet()
      ],
    );
  }
}
