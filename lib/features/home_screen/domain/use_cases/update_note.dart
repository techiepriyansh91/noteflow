import '../../../../core/model/note_model.dart';
import '../../data/repositories/note_repository.dart';

class UpdateNoteUseCase {
  final NoteRepository repository;

  UpdateNoteUseCase(this.repository);

  Future<void> call(Note note) {
    return repository.updateNote(note);
  }
  }