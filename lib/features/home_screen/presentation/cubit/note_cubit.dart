import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/model/note_model.dart';
import '../../domain/use_cases/add_note.dart';
import '../../domain/use_cases/delete_note.dart';
import '../../domain/use_cases/get_notes.dart';
import '../../domain/use_cases/update_note.dart';

class NoteCubit extends Cubit<List<Note>> {
  final AddNoteUseCase addNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;

  NoteCubit(
      this.addNoteUseCase,
      this.getNotesUseCase,
      this.deleteNoteUseCase,
      this.updateNoteUseCase,
      ) : super([]);

  /// Load all notes from repository
  Future<void> loadNotes() async {
    final notes = await getNotesUseCase();
    emit(notes);
  }

  /// Add a new note
  Future<void> addNote(Note note) async {
    await addNoteUseCase(note);
    await loadNotes();
  }

  /// Update an existing note
  Future<void> updateNote(Note note) async {
    await updateNoteUseCase(note);
    await loadNotes();
  }

  /// Delete a note by its ID
  Future<void> deleteNote(String noteId) async {
    await deleteNoteUseCase(noteId);
    await loadNotes();
  }
}
