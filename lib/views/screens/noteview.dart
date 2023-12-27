import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/note_view_body.dart';
import 'package:note_app/views/widgets/show_button_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ShowButtonSheet();
              });
        },
        child: Icon(Icons.add),
      ),
      body: NoteViewBody(),
    );
  }
}
