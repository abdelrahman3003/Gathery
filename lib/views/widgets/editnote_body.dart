import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant/CustomTextfield.dart';
import 'package:note_app/constant/customappbar.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/model/note_model.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title;
  String? subtilte;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomAppbar(
                icon: Icons.check,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtilte ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NoteCubit>(context).fetchnotes();
                  Navigator.pop(context);
                },
                title: "Edite Note",
              ),
            ),
            CustomTextfield(
              hintText: '',
              initialValue: widget.note.title,
              maxLines: 2,
              onChanged: (v) {
                title = v;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextfield(
              hintText: '',
              initialValue: widget.note.subtitle,
              maxLines: 6,
              onChanged: (v) {
                subtilte = v;
              },
            )
          ],
        ),
      ),
    );
  }
}
