import 'package:flutter/material.dart';
import 'package:notes_app/views/Widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTextField(hint: "title"),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: "description",
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
