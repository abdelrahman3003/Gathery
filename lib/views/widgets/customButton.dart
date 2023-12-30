import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note%20_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/note/note_cubit.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom(
      {super.key,
      required this.backgroundcolor,
      required this.textcolor,
      required this.text,
      this.borderRadius,
      required this.onPressed,
      this.width = 1.0});
  final Color backgroundcolor;
  final Color textcolor;
  final Function()? onPressed;
  BorderRadius? borderRadius;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNotefailure) {
          print(state.errorMessage);
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<NoteCubit>(context).fetchnotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 48,
          width: MediaQuery.of(context).size.width * width,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: backgroundcolor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(10)),
            ),
            child: state is AddNoteLoading
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
          ),
        );
      },
    );
  }
}
