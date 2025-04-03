import 'package:flutter/material.dart';
import 'package:notes_app/DataBase/note_model.dart';
import 'package:notes_app/DataBase/notes_provider.dart';
import 'package:notes_app/Widgets/edit_note_view_body.dart';
import 'package:notes_app/Widgets/icon_button_with_dialog.dart';
import 'package:provider/provider.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final Map<dynamic, dynamic> note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _title;
  late String _desc;

  @override
  void initState() {
    super.initState();
    // Initialize with old data
    _title = widget.note['title'];
    _desc = widget.note['desc'];
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await context.read<NotesProvider>().updateNote(
              Notes(
                id: widget.note['id'],
                title: _title,
                desc: _desc,
                date: DateTime.now().toString().substring(0, 10),
                color: widget.note['color'],
              ),
            );
        if (mounted) Navigator.pop(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving note: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text('Edit Note'),
        ),
        actions: [
          IconButtonWithDialog(
            onPressed: _saveChanges,
            title: "Confirm Edit",
            subtitle: "Are you sure you want to save changes?",
            icon: const Icon(Icons.check, size: 27, color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: EditNoteViewBody(
        formKey: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialTitle: widget.note['title'], // Pass old title
        initialDesc: widget.note['desc'], // Pass old description
        onTitleChanged: (value) => _title = value,
        onDescChanged: (value) => _desc = value,
      ),
    );
  }
}
