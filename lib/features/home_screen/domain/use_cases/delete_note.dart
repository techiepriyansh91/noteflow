import '../../../bottom_navigation/data/repositories/note_repository.dart';
import '../../data/repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteNote(id);
  }
}