import '../../../../core/model/note_model.dart';

abstract class NoteRepository {
  Future<void> addNote(Note note);
  Future<List<Note>> getNotes();
  Future<void> updateNote(Note note); // ✅ Add this
  Future<void> deleteNote(String id); // ✅ Add this if not already there
}
