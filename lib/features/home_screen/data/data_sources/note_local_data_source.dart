import '../../../../core/database/db_helper.dart';
import '../../../../core/model/note_model.dart';
import '../repositories/note_repository.dart';

/// Data Source Interface
abstract class NoteLocalDataSource {
  Future<void> addNote(Note note);
  Future<List<Note>> getAllNotes();        // changed to Future
  Future<void> updateNote(Note note);      // ✅ added
  Future<void> deleteNote(String id);
}

/// Data Source Implementation
class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final HiveDBHelper dbHelper;

  NoteLocalDataSourceImpl(this.dbHelper);

  @override
  Future<void> addNote(Note note) async {
    final box = HiveDBHelper.getNotesBox();
    await box.put(note.id, note);
  }

  @override
  Future<List<Note>> getAllNotes() async {
    final box = HiveDBHelper.getNotesBox();
    return box.values.cast<Note>().toList();
  }

  @override
  Future<void> updateNote(Note note) async {
    final box = HiveDBHelper.getNotesBox();
    await box.put(note.id, note);
  }

  @override
  Future<void> deleteNote(String id) async {
    final box = HiveDBHelper.getNotesBox();
    await box.delete(id);
  }
}

/// Repository Implementation
class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  NoteRepositoryImpl(this.localDataSource);

  @override
  Future<void> addNote(Note note) async {
    await localDataSource.addNote(note);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await localDataSource.getAllNotes();
  }

  @override
  Future<void> updateNote(Note note) async {
    await localDataSource.updateNote(note);
  }

  @override
  Future<void> deleteNote(String id) async {
    await localDataSource.deleteNote(id);
  }
}
