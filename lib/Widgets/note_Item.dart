import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/DataBase/notes_provider.dart';
import 'package:notes_app/Pages/edit_note_view.dart';
import 'package:notes_app/Widgets/icon_button_with_dialog.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });

  final Map<dynamic, dynamic> note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Color(note['color']),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note['title'],
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note['desc'],
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(221, 39, 39, 39),
                  ),
                ),
              ),
              trailing: IconButtonWithDialog(
                icon: Icon(FontAwesomeIcons.trash),
                title: 'Delete Note',
                subtitle: 'Are you sure you want to delete this note?',
                onPressed: () {
                  context.read<NotesProvider>().deleteNote(note['id']);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note['date'],
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
