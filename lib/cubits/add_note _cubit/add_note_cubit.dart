import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constant/constants.dart';
import 'package:note_app/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Color(0xffDD7373);
  addnote(NoteModel note) {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNotefailure(e.toString()));
    }
  }
}
