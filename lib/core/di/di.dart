import 'package:get_it/get_it.dart';
import '../../features/home_screen/data/data_sources/note_local_data_source.dart';
import '../../features/home_screen/data/repositories/note_repository.dart';
import '../../features/home_screen/domain/use_cases/add_note.dart';
import '../../features/home_screen/domain/use_cases/get_notes.dart';
import '../../features/home_screen/domain/use_cases/update_note.dart';
import '../../features/home_screen/domain/use_cases/delete_note.dart';
import '../../features/home_screen/presentation/cubit/note_cubit.dart';
import '../database/db_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Database
  sl.registerLazySingleton(() => HiveDBHelper());

  // Data Sources
  sl.registerLazySingleton<NoteLocalDataSource>(
        () => NoteLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<NoteRepository>(
        () => NoteRepositoryImpl(sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => AddNoteUseCase(sl()));
  sl.registerLazySingleton(() => GetNotesUseCase(sl()));
  sl.registerLazySingleton(() => UpdateNoteUseCase(sl()));
  sl.registerLazySingleton(() => DeleteNoteUseCase(sl()));

  // Cubit
  sl.registerFactory(() => NoteCubit(
    sl(), // AddNoteUseCase
    sl(), // GetNotesUseCase
    sl(), // DeleteNoteUseCase
    sl(), // UpdateNoteUseCase
  ));
}
