import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Note_Item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: const NoteItem(),
      ),
    );
  }
}
