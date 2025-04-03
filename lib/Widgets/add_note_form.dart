// lib/widgets/add_note_form.dart
import 'package:flutter/material.dart';
import 'package:notes_app/DataBase/note_model.dart';
import 'package:notes_app/DataBase/notes_provider.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, desc;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hint: "note title",
            onSaved: (value) => title = value,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: "note content",
            maxLines: 5,
            onSaved: (value) => desc = value,
          ),
          const SizedBox(height: 32),
          CustomButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                try {
                  final notesProvider = context.read<NotesProvider>();
                  await notesProvider.addNote(Notes(
                    title: title!,
                    desc: desc!,
                    date: DateTime.now().toString().substring(0, 10),
                    color: 0xffa1a1a1,
                  ));
                  if (mounted) Navigator.pop(context);
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error saving note: $e')));
                  }
                }
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
