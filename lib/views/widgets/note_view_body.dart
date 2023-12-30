import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant/customappbar.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/views/widgets/listNotes.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).fetchnotes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomAppbar(
              icon: Icons.search, onPressed: () {}, title: "Notes"),
        ),
        Expanded(child: ListNotes()),
      ],
    );
  }
}
