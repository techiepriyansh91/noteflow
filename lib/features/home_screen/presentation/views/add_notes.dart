import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/model/note_model.dart';
import '../../presentation/cubit/note_cubit.dart';

class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final Note? note;
  AddNotePage({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    /// If note is provided, populate the controllers for editing
    if (note != null) {
      titleController.text = note!.title;
      contentController.text = note!.content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(note == null ? 'Add Note' : 'Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final content = contentController.text.trim();
                if (title.isNotEmpty && content.isNotEmpty) {
                  final newNote = Note(
                    id: note?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title,
                    content: content,
                    createdAt: note?.createdAt ?? DateTime.now().toIso8601String(),
                    updatedAt: DateTime.now().toIso8601String(),
                  );

                  /// If note is provided, update the note, else add new note
                  if (note != null) {
                    context.read<NoteCubit>().updateNote(newNote);
                  } else {
                    context.read<NoteCubit>().addNote(newNote);
                  }

                  Navigator.pop(context);
                }
              },
              child: Text(note == null ? 'Save Note' : 'Update Note'),
            ),
          ],
        ),
      ),
    );
  }
}
