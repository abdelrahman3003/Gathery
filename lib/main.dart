import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant/constants.dart';

import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/screens/noteview.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: NoteView(),
      ),
    );
  }
}
