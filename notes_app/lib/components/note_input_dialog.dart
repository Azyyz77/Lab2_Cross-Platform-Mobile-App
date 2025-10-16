import 'package:flutter/material.dart';

class NoteInputDialog extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditing;
  final Function() onSave;

  const NoteInputDialog({
    Key? key,
    required this.controller,
    required this.isEditing,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isEditing ? 'Edit Note' : 'Add New Note'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Enter your note here...',
          border: OutlineInputBorder(),
        ),
        maxLines: 5,
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onSave();
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          child: const Text('Save'),
        ),
      ],
    );
  }
}