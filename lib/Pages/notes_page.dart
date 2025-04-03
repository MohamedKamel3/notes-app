// lib/Views/notes_page.dart
import 'package:flutter/material.dart';
import 'package:notes_app/DataBase/notes_provider.dart';
import 'package:notes_app/Widgets/icon_button_with_dialog.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_list_view.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text('Notes'),
        ),
        actions: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 24),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButtonWithDialog(
              onPressed: () => context.read<NotesProvider>().deleteAllNotes(),
              title: "Delete All Notes",
              subtitle: "Are you sure you want to delete all notes?",
              icon: Icon(Icons.delete, size: 27, color: Colors.white),
            ),
          )
        ],
      ),
      body: const NotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            elevation: 16,
            isDismissible: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
