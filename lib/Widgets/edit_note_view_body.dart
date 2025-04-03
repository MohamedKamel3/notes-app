import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.initialTitle,
    required this.initialDesc,
    required this.onTitleChanged,
    required this.onDescChanged,
  });

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final String initialTitle;
  final String initialDesc;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onDescChanged;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with old data
    _titleController = TextEditingController(text: widget.initialTitle);
    _descController = TextEditingController(text: widget.initialDesc);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: widget.formKey,
        autovalidateMode: widget.autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              controller: _titleController,
              hint: "Title",
              onChanged: (value) {
                widget.onTitleChanged(value);
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _descController,
              hint: "Description",
              maxLines: 5,
              onChanged: (value) {
                widget.onDescChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
