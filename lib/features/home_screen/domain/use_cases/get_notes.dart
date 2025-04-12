import '../../../../core/model/note_model.dart';
import '../../data/repositories/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call() {
    return repository.getNotes();
  }
}
