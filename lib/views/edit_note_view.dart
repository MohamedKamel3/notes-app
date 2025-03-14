import 'package:flutter/material.dart';
import 'package:notes_app/views/Widgets/Custom_Search_Icon.dart';
import 'package:notes_app/views/Widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: const Text('Edit Note'),
        ),
        actions: [
          CustomSearchIcon(
            icon: Icons.check,
          )
        ],
      ),
      body: EditNoteViewBody(),
    );
  }
}
