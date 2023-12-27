import 'package:flutter/material.dart';
import 'package:note_app/constant/CustomTextfield.dart';
import 'package:note_app/constant/colors.dart';
import 'package:note_app/views/widgets/customButton.dart';

class ShowButtonSheet extends StatelessWidget {
  const ShowButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintText: "Title",
                onSubmitted: (v) {},
                maxLines: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextfield(
                hintText: "Content",
                onSubmitted: (v) {},
                maxLines: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButtom(
                    backgroundcolor: kprimarycolor,
                    textcolor: Colors.black,
                    text: "Add",
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
