import 'package:flutter/material.dart';
import 'package:note_app/constant/CustomTextfield.dart';
import 'package:note_app/constant/constants.dart';
import 'package:note_app/views/widgets/customButton.dart';

class ShowButtonSheet extends StatelessWidget {
  const ShowButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Formtextfield()),
    );
  }
}

class Formtextfield extends StatefulWidget {
  const Formtextfield({super.key});

  @override
  State<Formtextfield> createState() => _FormtextfieldState();
}

class _FormtextfieldState extends State<Formtextfield> {
  final GlobalKey<FormState> formsate = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formsate,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextfield(
              hintText: "Title",
              onSaved: (v) {
                title = v;
              },
              maxLines: 1,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextfield(
              hintText: "Content",
              onSaved: (v) {
                content = v;
              },
              maxLines: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButtom(
                  backgroundcolor: kprimarycolor,
                  textcolor: Colors.black,
                  text: "Add",
                  onPressed: () {
                    if (formsate.currentState!.validate()) {
                      formsate.currentState!.save();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
