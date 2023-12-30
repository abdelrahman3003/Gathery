import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/model/note_model.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      padding: EdgeInsets.only(top: 24, bottom: 20, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Text(
                  note.title,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchnotes();
                  },
                  icon: const Icon(Icons.delete))),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 12),
            child: Text(note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.3),
                )),
          )
        ],
      ),
    );
  }
}
