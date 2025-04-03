// lib/widgets/notes_list_view.dart
import 'package:flutter/material.dart';
import 'package:notes_app/DataBase/notes_provider.dart';
import 'package:notes_app/widgets/note_item.dart';
import 'package:provider/provider.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.watch<NotesProvider>();

    if (notesProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (notesProvider.notes.isEmpty) {
      return Center(
        child: Text(
          "No Notes",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<NotesProvider>().loadNotes(),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: notesProvider.notes.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteItem(note: notesProvider.notes[index]),
        ),
      ),
    );
  }
}
