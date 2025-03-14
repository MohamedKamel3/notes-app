import 'package:flutter/material.dart';
import 'package:notes_app/views/Widgets/Add_Note_Bottom_Sheet.dart';
import 'package:notes_app/views/Widgets/Custom_Search_Icon.dart';
import 'package:notes_app/views/Widgets/Notes_List_View.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: const Text('Notes'),
        ),
        actions: [CustomSearchIcon(icon: Icons.search)],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(child: NotesListView())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
