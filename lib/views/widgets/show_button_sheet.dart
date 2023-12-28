import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/cubit/add_note_cubit.dart';
import 'package:note_app/views/widgets/formtextfield.dart';

class ShowButtonSheet extends StatelessWidget {
  const ShowButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const Formtextfield(),
        ),
      ),
    );
  }
}
